//
//  ScheduleContentView.m
//  ClassSchedule
//
//  Created by caiming on 16/9/12.
//  Copyright © 2016年 caiming. All rights reserved.
//

#import "ScheduleContentView.h"

@interface ScheduleContentView ()

@end
@implementation ScheduleContentView
{
    NSInteger _row ;
    NSInteger _column;
}

- (instancetype)initWithFrame:(CGRect)frame row:(NSInteger)row column:(NSInteger) column
{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, DayTimeView_Left_W+column*time_table_W, row*time_table_H)];
    if (self) {
        _row = row;
        _column = column;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 2);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetRGBStrokeColor(context, 240.0 / 255.0, 240.0 / 255.0, 240.0 / 255.0, 1.0);  //线的颜色
    CGContextBeginPath(context);
    
    
    //    画矩形
    CGContextSetRGBFillColor(context, 247.0 / 255.0, 247.0 / 255.0, 247.0 / 255.0, 1.0);
    //填充矩形
    for (int i =0; i<_column ; i++) {
        if (i%2==1) {
            CGContextFillRect(context, CGRectMake(i*(time_table_W ), 0, time_table_W ,  _row * time_table_H));
        }
    }
    
    //执行绘画
    CGContextStrokePath(context);
    
    
    
    
    
    CGContextMoveToPoint(context, 0, 0);  //起点坐标
    for (int i =0;i<_row*2+2; i++) {
        CGContextAddLineToPoint(context, [self X_PointInContent:rect index:i].x, [self X_PointInContent:rect index:i].y);   //终点坐标
    }
    
    if (_row/2 %2 !=0) {//偶数
        CGContextMoveToPoint(context, 0, 0);  //起点坐标
    }
    
    for (int i =0;i<_column*2+2; i++) {
        CGContextAddLineToPoint(context, [self Y_PointInContent:rect index:i].x, [self Y_PointInContent:rect index:i].y);   //终点坐标
    }
    CGContextStrokePath(context);
    
    
    
}
 

-(CGPoint)X_PointInContent:(CGRect)rect index:(NSInteger)index{
    
    CGFloat x = 0;
    CGFloat y = 0;
    y = (index/2 +index%2) *time_table_H ;
    if (index/2 %2 ==0) {//偶数
        x= 0;
    }else{
        x = rect.size.width;
    }
    
    return  CGPointMake(x, y);
    
}

-(CGPoint)Y_PointInContent:(CGRect)rect index:(NSInteger)index{
    
    CGFloat x = 0;
    CGFloat y = 0;
    y = (index/2 +index%2) *time_table_W ;
    if (index/2 %2 ==0) {//偶数
        x= 0;
    }else{
        x = _row * time_table_H;
    }
    
    return  CGPointMake(y,x);
    
}
@end
