//
//  ViewController.m
//  DKCalendar
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 deike. All rights reserved.
//

#import "ViewController.h"
#import "CalendarHomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav-Bar"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor  = [UIColor whiteColor];
    self.navigationItem.title = @"日  历";
    //    self.navigationController.navigationBar.color/
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 300, 50)];
    btn.backgroundColor = [UIColor blueColor];
    btn.tintColor = [UIColor whiteColor];
    btn.tag = 1;
    [btn setTitle:@"飞机票" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSString *dirt = NSHomeDirectory();
    NSLog(@"%@",dirt);
    
}
- (void)btnClick:(UIButton *)btn{
    
    CalendarHomeViewController *dtViewC = [[CalendarHomeViewController alloc] init];
    
    dtViewC.calendartitle = @"选择日期";
    
    [dtViewC setAirPlaneToDay:720 ToDateforString:nil];

     dtViewC.calendarblock = ^(CalendarDayModel *model){
    
    //单独拿日期
    [btn setTitle:[NSString stringWithFormat:@"%@  %@ %@",[model dayStr],[model toString],[model getWeek]] forState:UIControlStateNormal];
    
    
    NSLog(@"---------%@",[model toString]);


     };

    [self.navigationController pushViewController:dtViewC animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
