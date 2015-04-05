//
//  JDVideoSource.m
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import "JDVideoSource.h"
#import "JDVideoUtil.h"

NSString *const JDVideoSourceDefaultBucket = @"nirvawolf";

@implementation JDVideoSource


- (id)initWithVideoInfo:(JDVideoInfo *)info
{
    NSString *videoKey = [JDVideoUtil keyForVideoInfo:info];
    if (self = [super initWithBucket:JDVideoSourceDefaultBucket key:videoKey]) {
        _videoInfo = info;
    }
    
    return self;
}

+ (id)videoSource:(JDVideoInfo *)info
{
    return [[self alloc] initWithVideoInfo:info];
}

@end
