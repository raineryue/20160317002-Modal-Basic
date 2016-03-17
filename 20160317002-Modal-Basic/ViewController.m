//
//  ViewController.m
//  20160317002-Modal-Basic
//
//  Created by Rainer on 16/3/17.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

/** 定义一个modal的控制器属性，用来强引用 */
@property (nonatomic, strong) UIViewController *presentViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 *  这里还原modal的底层方法
 */
- (IBAction)modalButtonClickAction:(id)sender {
    // 创建需要modal的控制器
    TwoViewController *twoViewController = [[TwoViewController alloc] init];
    
    // 使用强引用属性对需要modal的控制器进行强引用
    self.presentViewController = twoViewController;
    
    // 获取当前window属性并且把需要modal的控制器视图添加到主窗口上
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [window addSubview:twoViewController.view];
    
    // 初始化需要modal的控制器视图的位移值
    twoViewController.view.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
    
    // 动画恢复modal控制器的视图
    [UIView animateWithDuration:0.25 animations:^{
        twoViewController.view.transform = CGAffineTransformIdentity;
    }];
    
//    [self presentViewController:twoViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
