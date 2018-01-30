//
//  Todo.m
//  EveryDo
//
//  Created by Yongwoo Huh on 2018-01-30.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString *)title description:(NSString *)todoDescription priorityNumber:(NSInteger)pNumber
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = todoDescription;
        _priorityNumber = pNumber;
        _isComplete = NO;
    }
    return self;
}

@end
