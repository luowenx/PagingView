//
//  CustomButton+badge.m
//  UIDynamicTest
//
//  Created by luowenx on 16/10/17.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "CustomButton+badge.h"
#import "NSObject+lwx_associate.h"

@interface CustomButton ()
lwx_property_strong(UIView *, badge)
@end

@implementation CustomButton (badge)

- (void) createBadgeView
{
    self.badge = [UIView newAutoLayoutView];
    [self addSubview:self.badge];
    [self.badge autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.titleLabel withOffset:0 relation:(NSLayoutRelationGreaterThanOrEqual)];
    [self.badge autoSetDimensionsToSize:CGSizeMake(10, 10)];
    [self.badge autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    self.badge.hidden = NO;
    self.badge.layer.cornerRadius = 5.;
    self.badge.layer.masksToBounds = YES;
    self.badge.backgroundColor = [UIColor redColor];
}

lwx_def_property_strong(UIView *, badge)

static const char isshowkey = '\0';
-(void)setIsShow:(BOOL)isShow
{
    [self willChangeValueForKey:@"isShow"];   // 使支持kvo
    [self lwx_retainAssociatedObject:@(isShow) forKey:&isshowkey];
    if (!self.badge) {
        [self createBadgeView];
    }
    self.badge.hidden = !isShow;
    [self didChangeValueForKey:@"isShow"];
}

-(BOOL)isShow
{
    return [self lwx_getAssociatedObjectForKey:&isshowkey];
}

static const char badgeColorkey = '\0';
-(void)setBadgeColor:(UIColor *)badgeColor
{
    [self lwx_retainAssociatedObject:badgeColor forKey:&badgeColorkey];
    self.badge.backgroundColor = badgeColor;
}

-(UIColor *)badgeColor
{
    return [self lwx_getAssociatedObjectForKey:&badgeColorkey];
}



@end
