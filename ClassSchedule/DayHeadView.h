//
//  DayHeadView.h
//  ClassSchedule
//
//  Created by caiming on 16/9/12.
//  Copyright © 2016年 caiming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayHeadView : UIView

@property (nonatomic,strong)  NSArray *  titleName;
/**
 设置当前日期
 */
-(void)currentDay:(NSInteger)day;

-(void)addSubHeadView;

 @end
