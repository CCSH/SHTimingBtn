//
//  UIButton+SHTiming.m
//  SHTimingBtn
//
//  Created by CSH on 2018/3/22.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import "UIButton+SHTiming.h"

@implementation UIButton (SHTiming)
//定时器
static NSTimer *timer;
//时间
static NSInteger courrentTime;
//超时时间
static NSInteger codeTime;
//回调
static TimeBlock timeBlock;

#pragma mark - 添加定时器
- (void)addTimingWithOutTime:(NSInteger)outTime block:(TimeBlock)block{
    //赋值
    codeTime = outTime;
    timeBlock = block;
}

#pragma mark - 开始计时
- (void)startTime{
    
    //初始化数据
    [self initData];
    //不可点击
    self.userInteractionEnabled = NO;
    
    //设置定时
    timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    
    [self updateTime];
}

#pragma mark - 停止计时
- (void)stopTime{
    
    //初始化数据
    [self initData];
    //可以点击
    self.userInteractionEnabled = YES;
    //回调
    if (timeBlock) {
        timeBlock(self, codeTime);
    }
}

#pragma mark - 更新时间
- (void)updateTime{

    courrentTime++;
    
    if (courrentTime >= codeTime) {
        //停止定时
        [self stopTime];
    }else{
        //回调
        if (timeBlock) {
            timeBlock(self, courrentTime);
        }
    }
}

#pragma mark - 初始化数据
- (void)initData{
    //初始化
    if (timer) {
        [timer invalidate];
    }
    courrentTime = -1;
}

@end
