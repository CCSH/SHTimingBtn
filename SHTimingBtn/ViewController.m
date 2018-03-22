//
//  ViewController.m
//  SHTimingBtn
//
//  Created by CSH on 2018/3/22.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+SHTiming.h"

@interface ViewController ()

@end

@implementation ViewController

static NSInteger codeTime = 5;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 20);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"发送验证码" forState:0];
    //添加倒计时
    [btn addTimingWithOutTime:codeTime block:^(UIButton *timeBtn, NSInteger time) {
        if (time >= codeTime) {//到时间了
            [timeBtn setTitle:@"发送验证码" forState:0];
            timeBtn.backgroundColor = [UIColor orangeColor];
        }else{
            [timeBtn setTitle:[NSString stringWithFormat:@"%ld S",codeTime - time] forState:0];
            timeBtn.backgroundColor = [UIColor grayColor];
        }
    }];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)btnClick:(UIButton *)btn{
    
    [btn startTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
