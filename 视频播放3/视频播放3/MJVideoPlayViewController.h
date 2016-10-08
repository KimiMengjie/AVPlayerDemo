//
//  MJVideoPlayViewController.h
//  视频播放3
//
//  Created by kimi on 16/10/8.
//  Copyright © 2016年 kimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJVideo;
//显示控制器
@interface MJVideoPlayViewController : UIViewController

@property (nonatomic, strong, readwrite) MJVideo *video;

@end
