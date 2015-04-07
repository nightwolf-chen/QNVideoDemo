//
//  ViewController.m
//  QNVideoDemo
//
//  Created by ChenJidong on 15/3/30.
//  Copyright (c) 2015年 nirvawolf. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "PBJViewController.h"

#import <PBJVision.h>
#import <MediaPlayer/MediaPlayer.h>

#import "JDVideoInfo.h"
#import "JDVideoSource.h"
#import "JDCloudData.h"
#import "JDCloudService.h"

#import <SVProgressHUD.h>

@interface ViewController ()<PBJViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *previewImageView;

@property (nonatomic,copy) NSString *currentVideoFilePath;
@property (nonatomic,strong) UIImage *currentThumbnailImage;
@property (weak, nonatomic) IBOutlet UILabel *progresslabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMoviewPlayer:(NSURL *)url
{
    MPMoviePlayerViewController *viewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:viewController];
}

- (JDCloudData *)videoData:(NSString *)videoPath
{
    JDVideoInfo *videoInfo = [[JDVideoInfo alloc] initWithUserId:@"testor"];
    videoInfo.filePath = videoPath;
    videoInfo.name = @"testor";
    videoInfo.vid = @"testor";
    
    JDVideoSource *videoSource = [JDVideoSource videoSource:videoInfo];
    
    JDCloudData *cloudData = [[JDCloudData alloc] init];
    cloudData.filePath = videoPath;
    cloudData.cloudResource = videoSource;
    cloudData.contentType = @"video/mp4";
    
    return cloudData;
}

#pragma mark - Button clicked events
- (IBAction)playLocalFileClicked:(id)sender {
    NSURL *url = [NSURL fileURLWithPath:_currentVideoFilePath];
    [self showMoviewPlayer:url];
}

- (IBAction)playOnlineFileClicked:(id)sender {
    JDCloudData *cloudData = [self videoData:_currentVideoFilePath];
    NSString *fileUrl = [cloudData.cloudResource getRerouceUrl];
    NSURL *url = [NSURL URLWithString:fileUrl];
    [self showMoviewPlayer:url];
}

- (IBAction)uploadFile:(id)sender {
    
    JDCloudData *cloudData = [self videoData:_currentVideoFilePath];
    
    [[JDCloudService sharedService] uploadWithData:cloudData UploadCallback:^(BOOL suc,NSError *err){
        
        _progresslabel.text = @"";
        
        if (suc) {
            NSLog(@"Video has been sent!");
            
            [self showMsg:@"视频已上传"];
            
        }else{
            NSString *msg = [NSString stringWithFormat:@"Video fail to upload %@",err];
            NSLog(@"%@",msg);
            
            [self showMsg:msg];
//            [SVProgressHUD showSuccessWithStatus:msg];
            
        }
    } withProgressCallback:^(float percent){
        NSLog(@"video is uploading :%.2f",percent);
        _progresslabel.text = [NSString stringWithFormat:@"%.0f %%",percent*100];
    }];
    
}

- (void)showMsg:(NSString *)msg
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD showSuccessWithStatus:msg];
    });
}

- (IBAction)showButton:(id)sender {
    PBJViewController *pbjViewControler = [[PBJViewController alloc] init];
    pbjViewControler.delegate = self;
    [self presentViewController:pbjViewControler animated:YES completion:^{}];
}

#pragma mark - PBJViewControllerDelegate
- (void)pbj_viewController:(PBJViewController *)vision capturedVideo:(NSDictionary *)videoDict error:(NSError *)error
{
    NSString *videoPath = [videoDict  objectForKey:PBJVisionVideoPathKey];
    self.currentVideoFilePath = videoPath;
    self.currentThumbnailImage  = videoDict[PBJVisionVideoThumbnailKey];
    
    _previewImageView.image = _currentThumbnailImage;
}

@end
