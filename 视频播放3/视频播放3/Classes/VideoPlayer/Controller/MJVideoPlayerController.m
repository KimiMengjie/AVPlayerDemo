//
//  MJVideoPlayerController.m
//  视频播放3
//
//  Created by kimi on 16/10/8.
//  Copyright © 2016年 kimi. All rights reserved.
//

#import "MJVideoPlayerController.h"
#import "MJVideoPlayerView.h"
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM(NSInteger, MJPanDirection){
    MJPanDirectionHorizontal, // 横向移动
    MJPanDirectionVertical,   // 纵向移动
};

/// 播放器显示和消失的动画时长
static const CGFloat kVideoPlayerControllerAnimationTimeInterval = 0.3f;

@interface MJVideoPlayerController ()

@property (nonatomic,strong)MJVideoPlayerView *videoView;

@end

@implementation MJVideoPlayerController

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super init];
    if (self) {
        self.view.frame = frame;
        self.view.backgroundColor = [UIColor blackColor];
        self.controlStyle = MPMovieControlStyleNone;
        [self.view addSubview:self.videoView];
        self.videoView.frame = self.view.bounds;
    }
    return self;
}

/// 展示播放器
- (void)showInView:(UIView *)view
{
    if ([UIApplication sharedApplication].statusBarStyle !=  UIStatusBarStyleLightContent) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    
    [view addSubview:self.view];
    
    self.view.alpha = 0.0;
    [UIView animateWithDuration:kVideoPlayerControllerAnimationTimeInterval animations:^{
        self.view.alpha = 1.0;
    } completion:^(BOOL finished) {}];
    
//    if (self.getDeviceOrientation == UIDeviceOrientationLandscapeLeft || self.getDeviceOrientation == UIDeviceOrientationLandscapeRight) {
//        [self changeToOrientation:self.getDeviceOrientation];
//    } else {
//        [self changeToOrientation:UIDeviceOrientationPortrait];
//    }
}


#pragma mark - 懒加载
-(MJVideoPlayerView *)videoView
{
    if (!_videoView) {
        _videoView = [[MJVideoPlayerView alloc]init];
        
    }
    return _videoView;
}

- (void)setVideo:(MJVideo *)video
{
    _video = video;
    
    // 标题
    self.videoView.titleLabel.text = self.video.title;
    // play url
    self.contentURL = [NSURL URLWithString:self.video.playUrl];
    
}

@end
