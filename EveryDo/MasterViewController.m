//
//  MasterViewController.m
//  EveryDo
//
//  Created by Yongwoo Huh on 2018-01-30.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "TodoTableViewCell.h"
#import "AddTodoViewController.h"

@interface MasterViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addTodoButton;


@property NSMutableArray<Todo *> *todoList;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    // setup todo data
    Todo *todo1 = [[Todo alloc] initWithTitle:@"make bed" description:@"make bed right after getting up." priorityNumber:1];
    Todo *todo2 = [[Todo alloc] initWithTitle:@"morning ritual" description:@"do morning meditation; morning pages; morning part of self journal everyday." priorityNumber:2];
    Todo *todo3 = [[Todo alloc] initWithTitle:@"finish today's work activies" description:@"work to finish daily work activies" priorityNumber:3];
    Todo *todo4 = [[Todo alloc] initWithTitle:@"work on incomplete assignments" description:@"after finishing today's work activies. Work on the incomplete tasks" priorityNumber:4];
    Todo *todo5 = [[Todo alloc] initWithTitle:@"go to totum gym" description:@"workout for at least 30 minutes everyday." priorityNumber:2];
    
    self.todoList = [@[todo1, todo2,todo3, todo4, todo5] mutableCopy];
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showTodoDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *todo = self.todoList[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setTodoDetail:todo];
    }
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    if ([segue.identifier isEqualToString:@"save"]) {
        AddTodoViewController *svc = segue.sourceViewController;
        
        Todo *newTodo = [[Todo alloc] initWithTitle:@"" description:@"" priorityNumber:1];
        newTodo = svc.todoToAdd;
        [self.todoList addObject:newTodo];
        [self.tableView reloadData];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoList.count;
}


- (TodoTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure cell

    Todo *todo = self.todoList[indexPath.row];
    [cell setTodo:todo];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todoList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
