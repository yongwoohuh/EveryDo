//
//  DetailViewController.m
//  EveryDo
//
//  Created by Yongwoo Huh on 2018-01-30.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setTodoDetail:(Todo *)newTodo
{
    if (self.todo != newTodo) {
        self.todo = newTodo;
            
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.todo) {
        self.todoTitleLabel.text = [NSString stringWithFormat:@"Title : %@", self.todo.title];
        self.todoDetailLabel.text = [NSString stringWithFormat:@"Description: %@", self.todo.todoDescription];
        self.priorityNumber.text = [NSString stringWithFormat:@"Priority Number: %ld", self.todo.priorityNumber];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
