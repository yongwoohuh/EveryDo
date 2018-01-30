//
//  TodoTableViewCell.h
//  EveryDo
//
//  Created by Yongwoo Huh on 2018-01-30.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface TodoTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *priorityNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *todoDescriptionLabel;

@property (nonatomic, weak) Todo *todo;

- (void)setTodo:(Todo *)todo;

@end
