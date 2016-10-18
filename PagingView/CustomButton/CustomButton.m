//
//  CustomButton.m
//  UIDynamicTest
//
//  Created by luowenx on 16/10/17.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "CustomButton.h"

@interface CustomButton ()

@property (strong, nonatomic, readwrite) UILabel *titleLabel;

@end

@implementation CustomButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 1;
        [self addSubview:_titleLabel];
        [_titleLabel autoSetDimension:ALDimensionWidth toSize:0 relation:(NSLayoutRelationGreaterThanOrEqual)];
        [_titleLabel autoCenterInSuperview];
        [self addTarget:self action:@selector(customButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void) customButtonAction
{
    if (_clickAction) {
        _clickAction(self);
    }
}

-(void)setSelected:(BOOL)selected
{
    if (selected) {
        _titleLabel.textColor = [UIColor orangeColor];
    } else{
        _titleLabel.textColor = [UIColor lightGrayColor];
    }
    [super setSelected:selected];
}

@end

