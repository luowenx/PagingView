//
//  CustomButton.h
//  UIDynamicTest
//
//  Created by luowenx on 16/10/17.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PureLayout.h"
@interface CustomButton : UIControl

@property (strong, nonatomic, readonly) UILabel *titleLabel;
//  点击回调
@property (copy, nonatomic) void (^clickAction) (CustomButton *);


@end
