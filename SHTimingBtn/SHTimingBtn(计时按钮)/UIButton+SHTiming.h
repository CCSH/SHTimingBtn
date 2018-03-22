//
//  UIButton+SHTiming.h
//  SHTimingBtn
//
//  Created by CSH on 2018/3/22.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TimeBlock)(UIButton *timeBtn,NSInteger time);

@interface UIButton (SHTiming)

//添加定时器
- (void)addTimingWithOutTime:(NSInteger)outTime block:(TimeBlock)block;
//开始计时
- (void)startTime;
//结束计时
- (void)stopTime;

@end
