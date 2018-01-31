//
//  DetailViewController.h
//  EveryDo
//
//  Created by Yongwoo Huh on 2018-01-30.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo *todo;
@property (weak, nonatomic) IBOutlet UILabel *todoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityNumber;

- (void)setTodoDetail:(Todo *)newTodo;

@end

