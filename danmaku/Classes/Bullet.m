//
//  Bullet.m
//  testBullet
//
//  Created by fangwenyu on 16/4/14.
//  Copyright © 2016年 fangwenyu. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.isStart = NO;
    }
    return self;
}


- (void)setSpeed:(double)speed andLength:(double)len andTrackLength:(double)trackLen {
    _speed = speed;
    _length = len;
    _trackLength = trackLen;
    
    _endDuring = (_trackLength + _length) / _speed;
    _arriveDuring = _trackLength / speed;
    _showAllDuring = _length / speed;
}

//获取剩余时间
- (NSTimeInterval)remainingTime {
    if (!_isStart) {
        //还没开始跑不能算剩余时间
        abort();
    }
    _remainingTime = _endDuring- ([[NSDate date]timeIntervalSince1970] - _startTimeInterval);
    //NSLog(@"%f", _remainingTime);
    return _remainingTime;
}

- (void)setIsStart:(BOOL)isStart {
    _isStart = isStart;
    if (isStart) {
       // NSLog(@"BOOM!");
    }
}

@end
