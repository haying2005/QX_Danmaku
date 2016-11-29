//
//  Track.h
//  testBullet
//
//  Created by fangwenyu on 16/4/14.
//  Copyright © 2016年 fangwenyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bullet.h"

@interface Track : UIView

@property (nonatomic, strong)Bullet *lastBullet; //最后发射的子弹
@property (nonatomic, assign)BOOL isReady; //是否可用，一次只能load一粒子弹
@property (nonatomic, assign)NSTimeInterval reminingTime;

//发射
- (void)lunchBullet:(Bullet *)bullet;

//装载
- (BOOL)loadBullet:(Bullet *)bullet;

@end
