//
//  Track.m
//  testBullet
//
//  Created by fangwenyu on 16/4/14.
//  Copyright © 2016年 fangwenyu. All rights reserved.
//

#import "Track.h"

@implementation Track

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.isReady = YES;
    }
    return self;
}

//发射
- (void)lunchBullet:(Bullet *)bullet {
    bullet.center = CGPointMake(0, self.bounds.size.height * 0.5);
    //bullet.left = self.bounds.size.width;
    [bullet setCenter:CGPointMake(self.bounds.size.width + bullet.bounds.size.width / 2, self.bounds.size.height / 2)];
    [self addSubview:bullet];
    bullet.isStart = YES;
    bullet.startTimeInterval = [[NSDate date]timeIntervalSince1970];
    self.lastBullet = bullet;
    //NSLog(@"boom!");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(bullet.showAllDuring * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.isReady = YES;
    });
    
    [UIView animateWithDuration:bullet.endDuring delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        //bullet.right = 0;
        CGRect frame = bullet.frame;
        frame.origin.x = - (frame.size.width);
        [bullet setFrame:frame];
    } completion:^(BOOL finished) {
        [bullet removeFromSuperview];
    }];

}

//上膛
- (BOOL)loadBullet:(Bullet *)bullet {
    if (!self.isReady) {
        return NO;
    }
    [bullet setSpeed:[UIScreen mainScreen].bounds.size.width / 3 andLength:bullet.bounds.size.width + 50 andTrackLength:self.bounds.size.width];
    NSTimeInterval timeAfter = bullet.arriveDuring > self.lastBullet.remainingTime ? 0 : self.lastBullet.remainingTime - bullet.arriveDuring;
    //timeAfter -= self.lastBullet.endDuring;
    //NSLog(@"%f", timeAfter);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeAfter * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //发射
        [self lunchBullet:bullet];
    });
    self.isReady = NO;
    return YES;
}

- (void)setIsReady:(BOOL)isReady {
    _isReady = isReady;
}

- (NSTimeInterval)reminingTime {
    if (!self.lastBullet) {
        return 0;
    }
    return self.lastBullet.remainingTime;
}


@end
