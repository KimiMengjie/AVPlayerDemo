//
//  ViewController.m
//  视频播放1
//
//  Created by kimi on 16/10/8.
//  Copyright © 2016年 kimi. All rights reserved.
//
//播放视频的基本思路

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

static const NSString *playerItemStatusContext;
@interface ViewController ()

@property (nonatomic,weak)AVPlayer *player;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.URL
    NSURL *assetURL = [[NSBundle mainBundle] URLForResource:@"hubblecast.m4v" withExtension:nil];
    
    //2.创建AVAsset实例
    AVAsset *asset =[AVAsset assetWithURL:assetURL];
    
    //3.创建AVPlayerItem指向资源用于播放
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    
    //对象创建的时候，播放条目默认是unknow状态，需要手动开启,这个状态表示当前媒体还未载入并且还不在播放队列中。
    /*
     AVPlayerItemStatusUnknown, 0
     AVPlayerItemStatusReadyToPlay, 1
     AVPlayerItemStatusFailed 2
     */
    //可以通过KVO来监视该属性的变化，判断是否播放等信息
    NSLog(@"%ld",(long)playerItem.status);
    
    
    
    [playerItem addObserver:self forKeyPath:@"status" options:0 context:&playerItemStatusContext];
    
    
    //4.创建AVPlayer的实例指向playeritem
    self.player = [AVPlayer playerWithPlayerItem:playerItem];
    
    //5.创建一个layer来直接播放vido的内容
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    
    //6.将图层加入到view的layer上
    [self.view.layer addSublayer:playerLayer];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context ==  &playerItemStatusContext) {
        //获取到观察的对象
        AVPlayerItem *playerItem = (AVPlayerItem *)object;
        //如果是未知，改成准备状态
        if (playerItem.status == AVPlayerStatusUnknown) {
            //播放
        }
    }
}


@end
