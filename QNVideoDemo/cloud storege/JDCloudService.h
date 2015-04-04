//
//  JDCloudService.h
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDCloudData;

@interface JDCloudService : NSObject

+ (instancetype)sharedService;

- (void)uploadWithData:(JDCloudData *)data
        UploadCallback:(void (^)(BOOL, NSError *))uploadCallback
  withProgressCallback:(void (^)(float))progressCallback;

@end
