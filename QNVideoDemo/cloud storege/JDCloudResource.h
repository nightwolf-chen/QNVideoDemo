//
//  JDCloudResource.h
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OSSBucket;

@interface JDCloudResource : NSObject

@property (nonatomic,copy,readonly) NSString *keyName;
@property (nonatomic,copy,readonly) NSString *bucketName;
@property (nonatomic,strong,readonly) OSSBucket *bucket;

- (NSString *)getRerouceUrl;

- (id)initWithBucket:(NSString *)bucketName key:(NSString *)key;

@end
