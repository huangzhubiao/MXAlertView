//
//  ViewController.m
//  MXAlertView
//
//  Created by Michael on 2018/1/18.
//  Copyright © 2018年 Michael. All rights reserved.
//

#import "ViewController.h"
#import "MXAlertView.h"

@interface ViewController () <MXAlertViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)alertTypeOneClicked {
    
    [MXAlertView showWithTopTitle:@"提示" bottomTitles:@[@"关闭播放"] content:@"你当前在4G模式，确定要播放？" dataSource:nil completionHandler:nil];
}

- (IBAction)alertTypeTwoClicked {
    
    [MXAlertView showWithTopTitle:@"提示" bottomTitles:@[@"关闭播放", @"前去设置"] content:@"你当前在4G模式，确定要播放？" dataSource:nil completionHandler:nil];
}

- (IBAction)alertTypeThreeClicked {

    [MXAlertView showWithTopTitle:@"提示" bottomTitles:@[@"关闭播放", @"继续播放", @"前去设置"] content:@"你当前在4G模式，确定要播放？" dataSource:nil completionHandler:^(int index, UIButton *sender) {
        
        //selected index is the same index as title in the `bottomTitles`
        if (index == 0) {
            //关闭播放
        } else if (index == 1) {
            //继续播放
        } else {
            //前去设置
        }
    }];
}

- (IBAction)alertTypeFourClicked {
    
    [MXAlertView showWithTopTitle:@"提示" bottomTitles:@[@"关闭播放", @"前去设置"] content:@"你当前在4G模式，确定要播放？" dataSource:self completionHandler:^(int index, UIButton *sender) {
        
        //selected index is the same index as title in the `bottomTitles`
        if (index == 0) {
            //关闭播放
        } else if (index == 1) {
            //继续播放
        } else {
            //前去设置
        }
    }];
}

- (UIView *)accessoryViewForContentInMXAlertView:(MXAlertView *)alertView {
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 4 * 15, 20)];
    
    UIView *timerImageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    timerImageView.layer.contents = (__bridge id)[[UIImage imageNamed:@"时钟.png"] CGImage];
    [accessoryView addSubview:timerImageView];
    
    CGRect timerImageViewFrame = timerImageView.frame;
    UILabel *timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(timerImageViewFrame) + 2, timerImageViewFrame.origin.y, 50, CGRectGetHeight(timerImageViewFrame))];
    timerLabel.font = [UIFont systemFontOfSize:15];
    timerLabel.textColor = [UIColor colorWithRed:49/255.0 green:194/255.0 blue:124/255.0 alpha:1.0];
    timerLabel.text = @"2:00";
    [accessoryView addSubview:timerLabel];
    
    return accessoryView;
}

@end
