//
//  JDCloudTestor.m
//  QNVideoDemo
//
//  Created by exitingchen on 15/4/4.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import "JDCloudTestor.h"
#import "JDCloudService.h"
#import "JDCloudResource.h"
#import "JDCloudData.h"

@implementation JDCloudTestor

+ (void)testUpload
{
    JDCloudResource *resource = [[JDCloudResource alloc] initWithBucket:@"nirvawolf" key:@"upload_test"];
    NSString *testStr = @"asdfasdfadfasdf";
    NSData *data = [testStr dataUsingEncoding:NSUTF8StringEncoding];
    JDCloudData *jdData = [[JDCloudData alloc] init];
    jdData.data = data;
    jdData.contentType = @"";
    jdData.cloudResource = resource;
    
    [[JDCloudService sharedService] uploadWithData:jdData
                                    UploadCallback:^(BOOL suc, NSError *err){
                                        
                                        if (suc) {
                                            NSLog(@"success");
                                        }else{
                                            NSLog(@"err %@",err);
                                        }
//                                        NSLog(@"upload %d",suc);
                                        
                                    }
                              withProgressCallback:^(float percent){
                                  NSLog(@"uploading .. %.2f %%",percent);
                              }];
}

@end
