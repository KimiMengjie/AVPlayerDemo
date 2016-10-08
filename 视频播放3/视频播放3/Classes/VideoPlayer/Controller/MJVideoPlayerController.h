//
//  MJVideoPlayerController.h
//  视频播放3
//
//  Created by kimi on 16/10/8.
//  Copyright © 2016年 kimi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MJVideo.h"

@interface MJVideoPlayerController : MPMoviePlayerController

/// video model
@property (nonatomic, strong, readwrite) MJVideo *video;

- (instancetype)initWithFrame:(CGRect)frame;
/// 展示播放器
- (void)showInView:(UIView *)view;

@end
