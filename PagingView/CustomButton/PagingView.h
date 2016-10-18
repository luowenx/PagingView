//
//  PagingView.h
//  UIDynamicTest
//
//  Created by luowenx on 16/10/17.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 
 *      PagingView  内部高度已设置  为 kDefaultPagingViewHight
 *      布局依赖于 PureLayout
 */


static CGFloat kDefaultPagingViewHight = 40;

@class CustomButton;
@interface PagingView : UIView

- (instancetype)initWithTitleArray:(NSArray *)titles;

//  当前选中item
@property (assign, nonatomic, readonly) NSInteger currentIndex;

// 选中某一个item
-(void)selectItemAtIdex:(NSInteger)idx;

// 获取其中一个item
- (CustomButton *)itemAtIdex:(NSInteger)idx;

@end
