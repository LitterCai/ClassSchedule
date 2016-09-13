//
//  ClassTimeScrollView.m
//  ClassSchedule
//
//  Created by caiming on 16/9/12.
//  Copyright © 2016年 caiming. All rights reserved.
//

#import "ClassTimeScrollView.h"
#import "ScheduleContentView.h"

@interface ClassTimeScrollView ()
@property (nonatomic,strong) ScheduleContentView* scheduleContentView;

@end

@implementation ClassTimeScrollView
{
    NSInteger _row ;
    NSInteger _column;
}

- (instancetype)initWithFrame:(CGRect)frame row:(NSInteger)row column:(NSInteger) column
{
    self = [super initWithFrame:frame];
    if (self) {
        _row = row;
        _column = column;
        
        [self addSubview:self.scheduleContentView];
    }
    return self;
}
//延迟加载
-(ScheduleContentView *)scheduleContentView
{
    //判断是否已经有了，若没有，则进行实例化
    if (!_scheduleContentView) {
        _scheduleContentView=[[ScheduleContentView alloc]initWithFrame:CGRectMake(0, 0, _column*time_table_W, DayHeadView_H*_row+DayHeadView_H) row:_row column:_column];
     }
    return _scheduleContentView;
}
@end
