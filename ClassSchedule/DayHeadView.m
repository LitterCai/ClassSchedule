//
//  DayHeadView.m
//  ClassSchedule
//
//  Created by caiming on 16/9/12.
//  Copyright © 2016年 caiming. All rights reserved.
//

#import "DayHeadView.h"
#import "UIColor+_6String.h"
@implementation DayHeadView
{
    UILabel *currentlable;
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor hexStringToColor:@"D9D9D9" ];
        self.layer.borderColor = [UIColor hexStringToColor:@"EEEEEE"  ].CGColor;
        self.layer.borderWidth =1;
 
        
        CALayer *shadowLayer = [CALayer layer];
        shadowLayer.frame = CGRectMake(0, frame.size.height-1, frame.size.width, 1);
        shadowLayer.backgroundColor = [UIColor whiteColor].CGColor;
        shadowLayer.shadowOffset = CGSizeMake(0, 1);
        shadowLayer.cornerRadius = 1.0;
        shadowLayer.shadowRadius = 1.0;
        shadowLayer.shadowColor = [UIColor grayColor].CGColor; //设置阴影的颜色为黑色
        shadowLayer.shadowOpacity = 1.0; //设置阴影的不透明度
        [self.layer addSublayer:shadowLayer];
        
    }
    return self;
}


-(void)addSubHeadView{
    
    for (int  i =0; i<7; i++) {
        
        UILabel * lable =[[UILabel alloc]initWithFrame:CGRectMake(50+ time_table_W*i, 0, time_table_W, DayHeadView_H)];
        lable.text = _titleName[i];
        lable.tag =1000+i;
        lable.textColor = [UIColor hexStringToColor:@"969696"];
        lable.font =[UIFont fontWithName:@"Helvetica-BoldOblique" size:18];
        lable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lable];
        
        if (i==0) {
            lable= currentlable;
            lable.textColor =[UIColor hexStringToColor:@"0168B7"];

        }
    }
    
}

-(void)currentDay:(NSInteger)day{
    currentlable.textColor = [UIColor hexStringToColor:@"969696"];

    UILabel * currentday = [self viewWithTag:day+1000-1];
    currentday.textColor = [UIColor hexStringToColor:@"0168B7"];

}





@end
