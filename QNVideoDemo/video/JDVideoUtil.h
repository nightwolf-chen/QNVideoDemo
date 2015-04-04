//
//  JDVideoUtil.h
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDVideoInfo;

@interface JDVideoUtil : NSObject

+ (NSString *)keyForVideoInfo:(JDVideoInfo *)info;

+ (NSString *)filePathForInfo:(JDVideoInfo *)info;

@end
