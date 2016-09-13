//
//  ClassTimeTables.h
//  ClassSchedule
//
//  Created by caiming on 16/9/12.
//  Copyright © 2016年 caiming. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ScheduleButton.h"
@interface ClassTimeTables : UIView<UIScrollViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame
                    titleName:(NSArray *)titleName
                     leftName:(NSArray *)leftName;


-(void)addSchedule:(CGPoint)point H:(CGFloat)H className:(NSString *)name;
@end
