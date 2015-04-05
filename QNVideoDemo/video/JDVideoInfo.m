//
//  JDVideoInfo.m
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import "JDVideoInfo.h"
#import "JDVideoSource.h"

@implementation JDVideoInfo

- (id)initWithUserId:(NSString *)userId
{
    if (self = [super init]) {
        _userId = userId;
        _createTime = [NSDate date];
    }
    
    return self;
}


@end
