//
//  ViewController.m
//  HNCustomPopView
//
//  Created by xydtech on 16/6/3.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import "ViewController.h"
#import "HNPopTableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        NSArray * arr =@[@"王海宁",@"王海宁",@"王海宁"];

    HNPopTableView * btn = [HNPopTableView buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 300, 100, 50);
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor grayColor];
    [btn addPopTableViewWithWindowFrame:CGRectZero selectData:arr action:^(NSInteger index) {
        
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {


}

@end
