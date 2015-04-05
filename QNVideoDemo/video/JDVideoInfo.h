//
//  JDVideoInfo.h
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDVideoSource;

@interface JDVideoInfo : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *vid;
@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *filePath;
@property (nonatomic,copy) NSDate *createTime;

- (id)initWithUserId:(NSString *)userId;


@end
