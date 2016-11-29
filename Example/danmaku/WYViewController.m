//
//  WYViewController.m
//  danmaku
//
//  Created by fangwenyu on 11/29/2016.
//  Copyright (c) 2016 fangwenyu. All rights reserved.
//

#import "WYViewController.h"
#import "Bullet.h"
#import "BulletsView.h"

@interface WYViewController ()

@end

@implementation WYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    BulletsView *bulletV = [[BulletsView alloc]initWithFrame:self.view.bounds];
    bulletV.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bulletV];
    
    for (int i = 0; i < 100; i ++) {
        Bullet *bullet = [[Bullet alloc] initWithFrame:CGRectMake(0, 0, arc4random()%200, 44)];
        [bullet setBackgroundColor: [UIColor redColor]];
        [bulletV addBullet:bullet];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
