//
//  DayTimeView.m
//  ClassSchedule
//
//  Created by caiming on 16/9/12.
//  Copyright © 2016年 caiming. All rights reserved.
//

#import "DayTimeView.h"
#import "UIColor+_6String.h"
@implementation DayTimeView
{
    CGFloat H ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        H = frame.size.height;
        self.backgroundColor = [UIColor hexStringToColor:@"F7F7F7"];
    }
    return self;
}

-(void)setLefttimeName:(NSArray *)lefttimeName{
    
    //时间的高度 是 内容的cell高度的两倍 so  ＊2
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, DayTimeView_Left_W, time_table_H*lefttimeName.count*2 +DayHeadView_H);
    for (int i = 0; i<lefttimeName.count; i++) {
        UILabel *labe =[[UILabel alloc] initWithFrame:CGRectMake(0,DayTimeView_Left_W-8 +i* DayTimeView_Left_W, DayTimeView_Left_W, 40)];
        labe.text = lefttimeName[i];
        labe.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        NSInteger leght = [labe.text length];
        labe.textAlignment = NSTextAlignmentCenter;
        NSMutableAttributedString *richText = [[NSMutableAttributedString alloc] initWithString:labe.text];
        [richText addAttribute:NSFontAttributeName value: [UIFont systemFontOfSize:15] range:NSMakeRange(leght-2, 2)];
        [richText addAttribute:NSForegroundColorAttributeName value:[UIColor hexStringToColor:@"949494"] range:NSMakeRange(leght-2, 2)];
        labe.attributedText =  richText;
        [self addSubview:labe];
        
    }
}

 

@end
