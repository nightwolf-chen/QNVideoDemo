//
//  JDVideoUtil.m
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import "JDVideoUtil.h"
#import "JDVideoInfo.h"

@implementation JDVideoUtil

+ (NSString *)keyForVideoInfo:(JDVideoInfo *)info
{
    return [NSString stringWithFormat:@"%@%@",info.name,info.vid];
}


@end
