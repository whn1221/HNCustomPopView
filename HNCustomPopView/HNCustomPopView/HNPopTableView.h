//
//  HNPopTableView.h
//  HNCustomPopView
//
//  Created by xydtech on 16/6/3.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNPopTableView : UIButton

/**
 *  创建一个弹出下拉控件
 *
 *  @param frame      尺寸
 *  @param selectData 选择控件的数据源
 *  @param action     点击回调方法
 *  @param animate    是否动画弹出
 */
- (void)addPopTableViewWithWindowFrame:(CGRect)frame
                                   selectData:(NSArray *)selectData
                                       action:(void(^)(NSInteger index))action;

@end
