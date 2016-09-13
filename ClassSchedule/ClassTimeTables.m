//
//  ClassTimeTables.m
//  ClassSchedule
//
//  Created by caiming on 16/9/12.
//  Copyright © 2016年 caiming. All rights reserved.
//



#import "UIColor+_6String.h"
#import "ClassTimeTables.h"
#import "DayHeadView.h"
#import "DayTimeView.h"
#import "ClassTimeScrollView.h"

@interface ClassTimeTables()

@property (nonatomic,strong) ClassTimeScrollView* contentview;
@property (nonatomic,strong) DayHeadView* dayview;
@property (nonatomic,strong) DayTimeView* timeview;

@property(nonatomic,assign) NSInteger row;
@property(nonatomic,assign) NSInteger coloum;

@property(nonatomic,strong) NSArray* titleName;
@property(nonatomic,strong) NSArray* leftName;
@end


@implementation ClassTimeTables

- (instancetype)initWithFrame:(CGRect)frame
                    titleName:(NSArray *)titleName
                    leftName:(NSArray *)leftName
{
    self = [super initWithFrame:frame];
    if (self) {
        _row =leftName.count *2;
        _coloum =titleName.count;
        _titleName = titleName;
        _leftName= leftName;
        
        [self addSubview:self.timeview];
        [self addSubview:self.dayview];
        [self addSubview:self.contentview];
    }
    return self;
}

-(void)addSchedule:(CGPoint)point H:(CGFloat)H className:(NSString *)name{
    
    ScheduleButton *schebutton = [ScheduleButton instances:point andH:H andName:name];
    [_contentview addSubview:schebutton];
    
}


//延迟加载
-(UIScrollView *)contentview
{
    
    //判断是否已经有了，若没有，则进行实例化
    if (!_contentview) {
        
        CGFloat HH= self.frame.size.height-self.frame.origin.y-DayHeadView_H+20;
        _contentview=[[ClassTimeScrollView alloc]initWithFrame:
                      CGRectMake(DayTimeView_Left_W,
                                 DayHeadView_H+2,
                                 self.frame.size.width-DayTimeView_Left_W,
                                 time_table_H * _row > HH ?HH:time_table_H * _row )
                                                           row:_row
                                                        column:_coloum ];
        [_contentview setBackgroundColor:[UIColor hexStringToColor:@"FFFFFF" ]];
        _contentview.contentSize = CGSizeMake(_coloum*time_table_W  ,_row*time_table_H);
        _contentview.delegate = self;
        _contentview.layer.borderColor=[UIColor hexStringToColor:@"E5E5E5"].CGColor;
        _contentview.layer.borderWidth=2;
        _contentview.bounces = NO;
        [self addSubview:_contentview];
    }
    return _contentview;
}

//延迟加载
-(DayHeadView *)dayview
{
    //判断是否已经有了，若没有，则进行实例化
    if (!_dayview) {
        _dayview=[[DayHeadView alloc]initWithFrame:CGRectMake(0, 0, _row*time_table_W +DayTimeView_Left_W, DayHeadView_H)];
        [_dayview setTitleName:_titleName];
        [_dayview currentDay:1];
        [_dayview addSubHeadView];
    }
    return _dayview;
}

//延迟加载
-(DayTimeView *)timeview
{
    //判断是否已经有了，若没有，则进行实例化
    if (!_timeview) {
        _timeview=[[DayTimeView alloc]initWithFrame:CGRectMake(0, 0, DayHeadView_H+_row*time_table_H, self.frame.size.height)];
        [_timeview setLefttimeName:_leftName];
    }
    return _timeview;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat x =scrollView.contentOffset.x;
    CGFloat y =scrollView.contentOffset.y;
    
    [_dayview setFrame:CGRectMake(-x, 0, _dayview.frame.size.width, _dayview.frame.size.height)];
    [_timeview setFrame:CGRectMake(0, -y, _timeview.frame.size.width, _timeview.frame.size.height)];

}


@end
