//
//  HNPopTableView.m
//  HNCustomPopView
//
//  Created by xydtech on 16/6/3.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import "HNPopTableView.h"

@interface HNPopTableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIView *popBackgroundView;
@property (nonatomic,copy) NSArray *selectData;
@property (nonatomic,copy) void(^action)(NSInteger index);


@end

UITableView * tableView;

@implementation HNPopTableView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIWindow *win = [[[UIApplication sharedApplication] windows] firstObject];
        self.popBackgroundView = [[UIView alloc] initWithFrame:win.bounds];
        self.popBackgroundView.backgroundColor = [UIColor colorWithHue:0
                                                       saturation:0
                                                       brightness:0 alpha:1];
        [win addSubview:self.popBackgroundView];

    }
    return self;
}

- (void)addPopTableViewWithWindowFrame:(CGRect)frame
                            selectData:(NSArray *)selectData
                                action:(void(^)(NSInteger index))action
{
    
    self.action = action;
    self.selectData = selectData;
    
    CGPoint point = [self convertPoint:self.frame.origin toView:self.popBackgroundView];
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(point.x, point.y, self.frame.size.width, 40 * selectData.count) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.layer.cornerRadius = 10.0f;
    tableView.layer.anchorPoint = CGPointMake(1.0, 0);
    tableView.transform =CGAffineTransformMakeScale(0.0001, 0.0001);
    
    tableView.rowHeight = 40;
    [self.popBackgroundView addSubview:tableView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundClick)];
    [self.popBackgroundView addGestureRecognizer:tap];
    
}
- (void)tapBackgroundClick
{
    [self hiden];
}
- (void)hiden
{
    if (self.popBackgroundView != nil) {
        
        [UIView animateWithDuration:0.3 animations:^{
            tableView.transform = CGAffineTransformMakeScale(0.000001, 0.0001);
        } completion:^(BOOL finished) {
            [self.popBackgroundView removeFromSuperview];
            [tableView removeFromSuperview];
            tableView = nil;
            self.popBackgroundView = nil;
        }];
    }
    
}
#pragma mark -- UITableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _selectData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"HNPopTableViewIdentifier";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:Identifier];
    }
    cell.textLabel.text = _selectData[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.action) {
        self.action(indexPath.row);
    }
    [self hiden];
}

@end
