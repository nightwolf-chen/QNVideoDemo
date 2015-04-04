//
//  JDCloudSecurity.h
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDCloudSecurity : NSObject

@property (nonatomic,strong) NSString *secretKey;
@property (nonatomic,strong) NSString *accessKey;

+ (instancetype)defaultSecurity;

@end
