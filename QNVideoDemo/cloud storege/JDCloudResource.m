//
//  JDCloudResource.m
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import "JDCloudResource.h"
#import "OSSData.h"
#import "OSSBucket.h"

@interface JDCloudResource ()

@property (nonatomic,strong) OSSData *ossData;
@property (nonatomic,strong,readwrite) OSSBucket *bucket;

@end

@implementation JDCloudResource

- (OSSData *)ossData
{
    if (!_ossData) {
        _ossData = [[OSSData alloc] initWithBucket:[[OSSBucket alloc] initWithBucket:_bucketName]  withKey:_keyName];
    }
    
    return _ossData;
}

- (NSString *)getRerouceUrl
{
    return [self.ossData getResourceURL];
}

- (id)initWithBucket:(NSString *)bucketName key:(NSString *)key
{
    if (self = [super init]) {
        _bucketName = bucketName;
        _keyName = key;
    }
    
    return self;
}

- (OSSBucket *)bucket
{
    if (_bucket == nil) {
        _bucket = [[OSSBucket alloc] initWithBucket:_bucketName];
    }
    
    return _bucket;
}

@end
