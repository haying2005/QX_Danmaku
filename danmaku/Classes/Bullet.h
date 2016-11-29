//
//  Bullet.h
//  testBullet
//
//  Created by fangwenyu on 16/4/14.
//  Copyright © 2016年 fangwenyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Bullet : UIView
@property (nonatomic, assign)NSTimeInterval startTimeInterval;   //since1970;
@property (nonatomic, assign)NSTimeInterval endDuring;//从开始到全部消失用时
@property (nonatomic, assign)NSTimeInterval arriveDuring;//到达轨道另一头用时
@property (nonatomic, assign)NSTimeInterval showAllDuring;//完全展示到屏幕的用时
@property (nonatomic, assign)double speed;

@property (nonatomic, assign)double length;

@property (nonatomic, assign)double trackLength;


@property (nonatomic, assign)BOOL isStart;

@property (nonatomic, assign)NSTimeInterval remainingTime;//剩余时间

- (void)setSpeed:(double)speed andLength:(double)len andTrackLength:(double)trackLen;


@end
