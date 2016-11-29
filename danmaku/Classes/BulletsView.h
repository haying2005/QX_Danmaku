//
//  BulletsView.h
//  testBullet
//
//  Created by fangwenyu on 16/4/14.
//  Copyright © 2016年 fangwenyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Track.h"
#import "Bullet.h"


@interface BulletsView : UIView
@property (nonatomic, strong)Track *track1;
@property (nonatomic, strong)Track *track2;
@property (nonatomic, strong)Track *track3;

@property (nonatomic, strong)NSMutableArray *trackArr;


@property (nonatomic, strong)NSMutableArray *dataSourceArr;

//上膛
- (BOOL)loadBullet:(Bullet *)bullet;

//添加子弹
- (void)addBullet:(Bullet *)bullet;

- (void)addBullets:(NSArray *)bullets;
@end
