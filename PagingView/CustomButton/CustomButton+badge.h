//
//  CustomButton+badge.h
//  UIDynamicTest
//
//  Created by luowenx on 16/10/17.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "CustomButton.h"

@interface CustomButton (badge)
//  是否显示badge
@property (assign, nonatomic) BOOL isShow;

//  badge的颜色
@property (strong, nonatomic) UIColor *badgeColor;

@end
