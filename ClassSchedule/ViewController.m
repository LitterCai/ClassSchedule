//
//  ViewController.m
//  ClassSchedule
//
//  Created by caiming on 16/9/12.
//  Copyright © 2016年 caiming. All rights reserved.
//

#import "ViewController.h"
#import "ClassTimeTables.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titleNameArray = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    NSArray *leftNameArray =@[@"6 AM",@"8 AM",@"10 AM",
                              @"12 AM",@"14 AM",@"16 AM",
                              @"18 AM",@"20 AM",@"22 AM",@"24 AM",
                              ];
    
    ClassTimeTables *lables =[[ClassTimeTables alloc]
                              initWithFrame:CGRectMake(0,
                                                       20,
                                                       self.view.frame.size.width,
                                                       self.view.frame.size.height-20)
                              titleName:titleNameArray
                              leftName:leftNameArray];
    
    [lables addSchedule:CGPointMake(time_table_W*1, 100) H:100 className:@"课程1"];

    [lables addSchedule:CGPointMake(time_table_W*2, 130) H:220 className:@"课程1－语文"];

    [self.view addSubview: lables];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientain:) name:UIDeviceOrientationDidChangeNotification object:nil];

}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    NSLog(@"%@",NSStringFromCGSize(size));
    NSLog(@"%@",coordinator);
    [self.view setNeedsDisplay];
}

-(void)orientain:(NSNotification *)sender{
    NSLog(@"%@",sender);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
