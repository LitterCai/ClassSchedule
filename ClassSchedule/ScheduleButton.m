//
//  ScheduleButton.m
//  ClassSchedule
//
//  Created by caiming on 16/9/13.
//  Copyright © 2016年 caiming. All rights reserved.
//

#import "ScheduleButton.h"
#import "UIColor+_6String.h"

@interface ScheduleButton ()

@property(nonatomic,strong) UILabel *textlable;
@end

@implementation ScheduleButton

+(id)instances:(CGPoint) point andH:(CGFloat)height andName:(NSString *)name{
    ScheduleButton *sche = [[ScheduleButton alloc] initWithFrame:CGRectMake(point.x, point.y, time_table_W, height) andName:name];
    
    return sche;
}

-(UILabel*)textlable{
    
    //判断是否已经有了，若没有，则进行实例化
    if (!_textlable) {
        _textlable=[[UILabel alloc]initWithFrame:self.bounds];
        _textlable.textAlignment = NSTextAlignmentCenter;
        _textlable.textColor = [UIColor whiteColor];
        _textlable.numberOfLines = 0;
    }
    return _textlable;
}

- (instancetype)initWithFrame:(CGRect)frame andName:(NSString *)name
{
    self = [super initWithFrame:frame];
    if (self) {

        
        self.layer.cornerRadius =8;
        self.layer.backgroundColor = [UIColor hexStringToColor:@""].CGColor;
        self.layer.borderColor = [UIColor hexStringToColor:@"d47252"].CGColor;
        self.layer.borderWidth = 1 ;
        
        CALayer *shadowLayer = [CALayer layer];
        shadowLayer.frame = CGRectMake(0, frame.size.height-1, frame.size.width, 1);
        shadowLayer.backgroundColor = [UIColor whiteColor].CGColor;
        shadowLayer.shadowOffset = CGSizeMake(0, 1);
        shadowLayer.cornerRadius = 1.0;
        shadowLayer.shadowRadius = 1.0;
        shadowLayer.shadowColor = [UIColor grayColor].CGColor; //设置阴影的颜色为黑色
        shadowLayer.shadowOpacity = 1.0; //设置阴影的不透明度
        [self.layer addSublayer:shadowLayer];
                
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        gradient.colors = [NSArray arrayWithObjects:
                           (id)[UIColor hexStringToColor:@"EEB357"].CGColor,
                           (id)[UIColor hexStringToColor:@"EA6B48"].CGColor,
                           (id)[UIColor hexStringToColor:@"E54F39"].CGColor,
                           nil];
        [self.layer insertSublayer:gradient atIndex:0];
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.textlable];
        self.textlable.text = name;
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha=0.2;
    }];
    [UIView commitAnimations];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha=1;
    }];
    [UIView commitAnimations];
    [ self sendActionsForControlEvents:UIControlEventTouchUpInside ];
    
}

@end
