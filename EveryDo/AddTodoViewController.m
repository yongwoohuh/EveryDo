//
//  AddTodoViewController.m
//  EveryDo
//
//  Created by Yongwoo Huh on 2018-01-30.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "AddTodoViewController.h"

@interface AddTodoViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *todoTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityNumberControl;
@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.todoToAdd = [[Todo alloc]initWithTitle:@"" description:@"" priorityNumber:1];
    self.todoTitleTextField.delegate = self;
    self.descriptionTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.todoToAdd.priorityNumber = self.priorityNumberControl.selectedSegmentIndex + 1;
    NSLog(@"priority Number is %ld", self.todoToAdd.priorityNumber);
    
    self.todoToAdd.title = self.todoTitleTextField.text;
    NSLog(@"todo title is : %@", self.todoToAdd.title);
}


#pragma mark - text field
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.todoTitleTextField) {
        NSLog(@"todoTitle delegate");
    } else if (textField == self.descriptionTextField) {
        NSLog(@"description delegate");
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.todoTitleTextField) {
        [textField resignFirstResponder];
        [self.descriptionTextField becomeFirstResponder];
    } else if (textField == _descriptionTextField) {
        [self.descriptionTextField resignFirstResponder];
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if ( [self.todoToAdd isValid] ) {
        return YES;
    }
    return NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.todoToAdd.title = self.todoTitleTextField.text;
    self.todoToAdd.todoDescription = self.descriptionTextField.text;
    self.todoToAdd.priorityNumber = self.priorityNumberControl.selectedSegmentIndex +1;
}

@end
