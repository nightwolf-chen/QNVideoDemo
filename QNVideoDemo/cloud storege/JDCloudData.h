//
//  JDCloudData.h
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDCloudResource;

@interface JDCloudData : NSObject

@property (nonatomic,strong) JDCloudResource *cloudResource;
@property (nonatomic,strong) NSData *data;
@property (nonatomic,copy)   NSString *filePath;
@property (nonatomic,strong) NSString *contentType;


@end
