//
//  BulletsView.m
//  testBullet
//
//  Created by fangwenyu on 16/4/14.
//  Copyright © 2016年 fangwenyu. All rights reserved.
//

#import "BulletsView.h"

@interface BulletsView ()
{
    NSMutableArray *bulletsArr; //弹夹，发射一颗 remove一颗
    NSTimer *timer;
}
@end
@implementation BulletsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        _trackArr = [NSMutableArray array];
        bulletsArr = [NSMutableArray array];
        CGFloat height = self.frame.size.height / 3;
        self.track1 = [[Track alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, height)];
        self.track1.backgroundColor = [UIColor clearColor];
        [self addSubview:self.track1];

        
        self.track2 = [[Track alloc]initWithFrame:CGRectMake(0, height, frame.size.width, height)];
        self.track2.backgroundColor = [UIColor clearColor];
        [self addSubview:self.track2];
        
        self.track3 = [[Track alloc]initWithFrame:CGRectMake(0, height * 2, frame.size.width, height)];
        self.track3.backgroundColor = [UIColor clearColor];
        [self addSubview:self.track3];
        
        
        [_trackArr addObject:_track1];
        [_trackArr addObject:_track2];
        [_trackArr addObject:_track3];
        
    }
    
    return self;
}

//上膛
- (BOOL)loadBullet:(Bullet *)bullet {
    Track *bestTrack = nil;
    for (Track *track in _trackArr) {
        if (!track.isReady) {
            continue;
        }
        if (track.lastBullet.remainingTime <= bestTrack.lastBullet.remainingTime) {
            bestTrack =  track;
        }
        bestTrack = track;
    }
    if (!bestTrack) {
        return NO;
    }
    else {
        [bestTrack loadBullet:bullet];
        return YES;
    }
}

- (void)tryToLoad {
    if (bulletsArr.count == 0) {
        [timer invalidate];
        timer = nil;
        //NSLog(@"timer stop...");
        return;
    }
    if ([self loadBullet:[bulletsArr objectAtIndex:0]]) {
        [bulletsArr removeObjectAtIndex:0];
        return;
    }
}

- (void)addBullet:(Bullet *)bullet {
    if (!timer) {
        if (!timer) {
            timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tryToLoad) userInfo:nil repeats:YES];
            
            //NSLog(@"timer start...");
        }
    }
    [bulletsArr addObject:bullet];
}

- (void)addBullets:(NSArray *)bullets {
    if (!timer) {
        if (!timer) {
            timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tryToLoad) userInfo:nil repeats:YES];
            //NSLog(@"timer start...");
        }
    }
    [bulletsArr addObjectsFromArray:bullets];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat height = self.frame.size.height / 3;
    [self.track1 setFrame:CGRectMake(0, 0, self.bounds.size.width, height)];
    [self.track2 setFrame:CGRectMake(0, height, self.bounds.size.width, height)];
    [self.track3 setFrame:CGRectMake(0, height * 2, self.bounds.size.width, height)];
    
}

@end

