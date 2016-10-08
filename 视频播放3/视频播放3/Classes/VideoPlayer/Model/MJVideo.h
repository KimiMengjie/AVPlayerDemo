//
//  MJVideo.h
//  视频播放3
//
//  Created by kimi on 16/10/8.
//  Copyright © 2016年 kimi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJVideo : NSObject

/// 标题
@property (nonatomic, copy, readwrite) NSString *title;
/// 播放地址
@property (nonatomic, copy, readwrite) NSString *playUrl;

@end
