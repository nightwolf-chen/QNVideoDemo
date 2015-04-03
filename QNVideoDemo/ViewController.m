//
//  ViewController.m
//  QNVideoDemo
//
//  Created by ChenJidong on 15/3/30.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import "ViewController.h"

#import <MediaPlayer/MediaPlayer.h>
#import <SCRecorder.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (IBAction)showButton:(id)sender {
    [self showMoviewPlayer];
}

- (void)showMoviewPlayer
{
    NSURL *url = [NSURL URLWithString:@"http://nirvawolf.oss-cn-shenzhen.aliyuncs.com/IMG_1081.mp4"];
    MPMoviePlayerViewController *aMovieViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:aMovieViewController];
    
    // Create the recorder
//    SCRecorder *recorder = [SCRecorder recorder]; // You can also use +[SCRecorder sharedRecorder]
    
//    // Start running the flow of buffers
//    if (![recorder startRunning]) {
//        NSLog(@"Something wrong there: %@", recorder.error);
//    }
//    
//    // Create a new session and set it to the recorder
//    recorder.session = [SCRecordSession recordSession];
//    
//    // Begin appending video/audio buffers to the session
//    [recorder record];
//    
//    // Stop appending video/audio buffers to the session
//    [recorder pause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
