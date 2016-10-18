//
//  ViewController.m
//  PagingView
//
//  Created by luowenx on 16/10/18.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"
#import "PagingView.h"
#import "CustomButton+badge.h"
@interface ViewController ()<PagingViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test3];
//    [self test4];
    [self test5];
}


#pragma mark  ======   test3、test4、test5

-(void)test5
{
    NSArray *array = @[@"我是一个按钮",@"按钮2",@"第三个按钮"];
    PagingView *pag = [[PagingView alloc] initWithTitleArray:array];
    [self.view addSubview:pag];
    pag.delegate = (id)self;
    [pag autoCenterInSuperview];
    [pag autoPinEdgeToSuperviewMargin:ALEdgeLeft];
    CustomButton *tmpItem = [pag itemAtIdex:1];
    tmpItem.isShow = YES;
    tmpItem.badgeColor = [UIColor orangeColor];
}

- (void) test4
{
    NSArray *array = @[@"我是一个按钮",@"按钮2",@"第三个按钮"];
    PagingView *pag = [[PagingView alloc] initWithTitleArray:array];
    [self.view addSubview:pag];
    [pag autoCenterInSuperview];
    [pag autoPinEdgeToSuperviewMargin:ALEdgeLeft];
    
    CustomButton *tmpItem = [pag itemAtIdex:1];
    
    UIView *dot = [UIView newAutoLayoutView];
    [dot setBackgroundColor:[UIColor redColor]];
    [tmpItem addSubview:dot];
    [dot autoSetDimensionsToSize:CGSizeMake(10, 10)];
    [dot autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    dot.layer.cornerRadius = 5.;
    dot.layer.masksToBounds = YES;
    [dot autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:tmpItem.titleLabel withOffset:0 relation:(NSLayoutRelationGreaterThanOrEqual)];
    
}

- (void) test3
{
    NSArray *array = @[@"我是一个按钮",@"按钮2",@"第三个按钮"];
    UIView *emlpView = [UIView newAutoLayoutView];
    [self.view addSubview:emlpView];
    [emlpView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [emlpView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [emlpView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [emlpView autoSetDimension:ALDimensionHeight toSize:40];
    
    __block CustomButton* lastBtn;
    __weak typeof(emlpView) weakemlpView = emlpView;
    NSMutableArray *viewArray = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CustomButton *btn = [CustomButton newAutoLayoutView];
        btn.tag = idx + 666;
        [weakemlpView addSubview:btn];
        btn.titleLabel.text = obj;
        if (idx == 0) {
            [btn autoPinEdgeToSuperviewEdge:(ALEdgeLeft)];
        }
        if (idx + 1 == array.count) {
            [btn autoPinEdgeToSuperviewEdge:(ALEdgeRight)];
        }
        if (lastBtn) {
            [btn autoPinEdge:(ALEdgeLeft) toEdge:(ALEdgeRight) ofView:lastBtn];
        }
        [btn autoPinEdgeToSuperviewEdge:(ALEdgeTop)];
        [btn autoPinEdgeToSuperviewEdge:(ALEdgeBottom)];
        
        __weak typeof(btn) weakbtn = btn;
        [btn setClickAction:^(CustomButton *button) {
            NSLog(@"%@",weakbtn.titleLabel.text);
        }];
        
        lastBtn = btn;
        
        [viewArray addObject:btn];
    }];
    
    [viewArray autoMatchViewsDimension:(ALDimensionWidth)];
}

#pragma mark ===    PagingViewDelegate

- (BOOL)willSelectPage:(PagingView *)pagingView index:(NSUInteger)index
{
    NSLog(@"willselect -- %@",@(index));
    return YES;
}

-(void)didSelectPage:(PagingView *)pagingView index:(NSUInteger)index
{
    NSLog(@"didselect -- %@",@(index));
}

@end
