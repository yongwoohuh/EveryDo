//
//  TodoTableViewCell.m
//  EveryDo
//
//  Created by Yongwoo Huh on 2018-01-30.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "TodoTableViewCell.h"

@implementation TodoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTodo:(Todo *)todo
{
    _todo = todo;
    [self configureCell];
}

- (void)configureCell
{
    self.titleLabel.text = self.todo.title;
    self.priorityNumberLabel.text = [NSString stringWithFormat:@"%ld", self.todo.priorityNumber];
    self.todoDescriptionLabel.text = self.todo.todoDescription;
}

@end
