//
//  ViewController.m
//  视频播放3
//
//  Created by kimi on 16/10/8.
//  Copyright © 2016年 kimi. All rights reserved.
//

#import "ViewController.h"
#import "MJVideoPlayViewController.h"
#import "MJVideo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playLocalVideo:(UIButton *)sender {
    //1.URL
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"150511_JiveBike" withExtension:@"mov"];
    MJVideo *video = [MJVideo new];
    //2.获取本地绝对路径
    video.playUrl = videoURL.absoluteString;
    video.title = @"本地播放";
    
    MJVideoPlayViewController *vc = [[MJVideoPlayViewController alloc] init];
    //传入播放信息模型
    vc.video = video;
    vc.hidesBottomBarWhenPushed = true;
    
    [self.navigationController pushViewController:vc animated:true];
    
    
    
}
- (IBAction)playRemotVideo:(UIButton *)sender {
}

@end
