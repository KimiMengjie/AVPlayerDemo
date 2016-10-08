//
//  MJVideoPlayViewController.m
//  视频播放3
//
//  Created by kimi on 16/10/8.
//  Copyright © 2016年 kimi. All rights reserved.
//

#import "MJVideoPlayViewController.h"
#import "MJVideoPlayerController.h"


#define kZXVideoPlayerOriginalWidth  MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define kZXVideoPlayerOriginalHeight (kZXVideoPlayerOriginalWidth * (11.0 / 16.0))

@interface MJVideoPlayViewController ()
@property (nonatomic,strong) MJVideoPlayerController *viewController;

@end

@implementation MJVideoPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self playVideo];
}

- (void)playVideo{
    if (!self.viewController) {
        self.viewController = [[MJVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, kZXVideoPlayerOriginalWidth, kZXVideoPlayerOriginalHeight)];
        
        [self.viewController showInView:self.view];
    }
    self.viewController.video = self.video;
}

@end
