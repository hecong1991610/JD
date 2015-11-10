//
//  ViewController.m
//  JD
//
//  Created by fandi on 15/11/10.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "ViewController.h"
#import "JDStatusBarNotification.h"


@interface ViewController ()

@property (nonatomic, assign) CGFloat pro;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // [JDStatusBarNotification showWithStatus:@"贺聪"];
    // 3秒后自动消失
    [JDStatusBarNotification dismissAfter:10];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(clickTime) userInfo:nil repeats:YES];
    self.pro = 0;
    // [JDStatusBarNotification showWithStatus:@"再见" styleName:JDStatusBarStyleMatrix];
   NSString * str = [JDStatusBarNotification addStyleNamed:@"欢迎" prepare:^JDStatusBarStyle *(JDStatusBarStyle *style) {
       

       // 改变bar的属性
       style.barColor = [UIColor cyanColor];
       style.textColor = [UIColor yellowColor];
       style.font = [UIFont systemFontOfSize:20];
       // 改变阴影属性
       style.textShadow = [[NSShadow alloc] init];
       style.textShadow.shadowColor = [UIColor blueColor];
       style.textShadow.shadowOffset = CGSizeMake(2, 2);
       // 进度条的属性
       style.progressBarColor = [UIColor redColor];
       style.progressBarHeight = 10;
       style.progressBarPosition = JDStatusBarProgressBarPositionTop;
       // 改变消失时的效果
       style.animationType = JDStatusBarAnimationTypeBounce;
        return style;
    }];
    [JDStatusBarNotification showWithStatus:str styleName:@"欢迎"];
}


- (void)clickTime{
    
    _pro+= (1.0 / 100.0);
    [JDStatusBarNotification showProgress:_pro];
    
}



- (IBAction)action:(UIButton *)sender {
    
    [JDStatusBarNotification dismiss];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
