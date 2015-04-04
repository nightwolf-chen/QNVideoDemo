//
//  JDCloudSecurity.m
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import "JDCloudSecurity.h"

@implementation JDCloudSecurity

+ (instancetype)defaultSecurity
{
    return [[[self class] alloc] init];
}

- (instancetype)init
{
    if (self = [super init]) {
        _accessKey = @"DybJLoAp3cyeqeN0";
        _secretKey = @"6p6V3sgdtSk9PauWZ9wg6jt5Ly8wlI";
    }
    
    return self;
}

@end
