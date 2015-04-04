//
//  JDVideoSource.h
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDCloudResource.h"

extern NSString *const JDVideoSourceDefaultBucket;

@class JDVideoInfo;

@interface JDVideoSource : JDCloudResource

@property (nonatomic,strong,readonly) JDVideoInfo *videoInfo;

- (id)initWithVideoInfo:(JDVideoInfo *)info;

+ (id)videoSource:(JDVideoInfo *)info;

@end
