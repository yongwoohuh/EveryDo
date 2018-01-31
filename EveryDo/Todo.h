//
//  Todo.h
//  EveryDo
//
//  Created by Yongwoo Huh on 2018-01-30.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *todoDescription;
@property (nonatomic, assign) NSInteger priorityNumber;
@property (nonatomic, assign) BOOL isComplete;

- (instancetype)initWithTitle:(NSString *)title description:(NSString *)todoDescription priorityNumber:(NSInteger)pNumber;
- (BOOL)isValid;

@end
