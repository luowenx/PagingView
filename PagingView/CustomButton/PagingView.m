//
//  PagingView.m
//  UIDynamicTest
//
//  Created by luowenx on 16/10/17.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "PagingView.h"
#import "CustomButton.h"

@interface PagingView ()

@property (strong, nonatomic) NSMutableArray *items;

@property (strong, nonatomic) NSArray *titles;


@end

@implementation PagingView

-(instancetype)initWithTitleArray:(NSArray *)titles
{
    self = [super init];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.titles = titles;
        [self initUI];
    }
    return self;
}

-(void) initUI
{
    __block CustomButton* lastBtn;
    __weak typeof(self) weakself = self;
    self.items = [NSMutableArray array];
    __weak typeof(self.items) weakViews = self.items;
    
    [self autoSetDimension:(ALDimensionHeight) toSize:kDefaultPagingViewHight];
    [self.titles enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CustomButton *btn = [CustomButton newAutoLayoutView];
        btn.tag = idx + 666;
        [weakself addSubview:btn];
        btn.titleLabel.text = obj;
        btn.selected = NO;
        if (idx == 0) {
            _currentIndex = 0;
            btn.selected = YES;
            [btn autoPinEdgeToSuperviewEdge:(ALEdgeLeft)];
        }
        if (idx + 1 == self.titles.count) {
            [btn autoPinEdgeToSuperviewEdge:(ALEdgeRight)];
        }
        if (lastBtn) {
            [btn autoPinEdge:(ALEdgeLeft) toEdge:(ALEdgeRight) ofView:lastBtn];
        }
        [btn autoPinEdgeToSuperviewEdge:(ALEdgeTop)];
        [btn autoPinEdgeToSuperviewEdge:(ALEdgeBottom)];
        
        [btn setClickAction:^(CustomButton *button) {
            [weakself clickActionOnItemIdex:button.tag - 666];
        }];
        
        lastBtn = btn;
        
        [weakViews addObject:btn];
    }];
    [self.items autoMatchViewsDimension:(ALDimensionWidth)];
}

- (void) clickActionOnItemIdex:(NSInteger) index
{
    if (_delegate && [_delegate respondsToSelector:@selector(willSelectPage:index:)] && ![_delegate willSelectPage:self index:index]) {
        return;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectPage:index:)]) {
        [_delegate didSelectPage:self index:index];
    }
    [self updateItemAtIndex:index];
}

- (void) updateItemAtIndex:(NSInteger)index
{
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[CustomButton class]]) {
            if (index + 666 == ((CustomButton *)obj).tag) {
                [(CustomButton *)obj setSelected:YES];
            }else{
                [(CustomButton *)obj setSelected:NO];
            }
        }
    }
}

#pragma mark  ========  operation
- (void)selectItemAtIdex:(NSInteger)idx
{
    if (_currentIndex == idx) {
        return;
    }
    _currentIndex = idx;
    [self updateItemAtIndex:idx];
}

- (CustomButton *)itemAtIdex:(NSInteger)idx
{
    CustomButton *item;
    item = (CustomButton*)[self viewWithTag:(idx + 666)];
    return item;
}

@end
