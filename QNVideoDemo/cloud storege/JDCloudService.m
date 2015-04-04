//
//  JDCloudService.m
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import "JDCloudService.h"
#import "OSSClient.h"
#import "JDCloudSecurity.h"
#import "OSSTool.h"
#import "OSSData.h"
#import "JDCloudData.h"
#import "JDCloudResource.h"

@implementation JDCloudService

+ (instancetype)sharedService
{
    static id s_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [[[self class] alloc] _init];
    });
    
    return s_instance;
}

- (id)_init
{
    if (self = [super init]){
        [OSSClient sharedInstanceManage].globalDefaultBucketHostId = @"oss-cn-shenzhen.aliyuncs.com";
        [[OSSClient sharedInstanceManage] setGenerateToken:^(NSString *method,
                                                             NSString *md5,
                                                             NSString *type,
                                                             NSString *date,
                                                             NSString *xoss,
                                                             NSString *resource){
            
            NSString *signature = nil;
            JDCloudSecurity *security = [JDCloudSecurity defaultSecurity];
            NSString *content = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@%@", method, md5, type, date, xoss, resource];
            signature = [OSSTool calBase64Sha1WithData:content withKey:security.secretKey];
            signature = [NSString stringWithFormat:@"OSS %@:%@",security.accessKey,signature];
            
            NSLog(@"Here signature:%@",signature);
            
            return signature;
            
        }];
    }
    
    return self;
}

- (void)uploadWithData:(JDCloudData *)data
        UploadCallback:(void (^)(BOOL, NSError *))uploadCallback
  withProgressCallback:(void (^)(float))progressCallback
{
    OSSData *ossData = [[OSSData alloc] initWithBucket:data.cloudResource.bucket withKey:data.cloudResource.keyName];
    [ossData setData:data.data withType:data.contentType];
    [ossData uploadWithUploadCallback:uploadCallback withProgressCallback:progressCallback];
}

@end
