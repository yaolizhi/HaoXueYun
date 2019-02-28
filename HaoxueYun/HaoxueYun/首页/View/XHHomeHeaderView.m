//
//  XHHomeHeaderView.m
//  HaoxueYun
//
//  Created by mac on 2019/2/28.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import "XHHomeHeaderView.h"

@interface XHHomeHeaderView ()


@property (nonatomic,strong) XHHomePokerView *pokerView; //!< 扑克效果
@property (nonatomic,strong) XHHomeKindView *kindView; //!< 科目视图
@property (nonatomic,strong) XHHomeAdvertisementView *advertisementView; //!< 广告视图




@end

@implementation XHHomeHeaderView


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.pokerView];
        [self addSubview:self.advertisementView];
        [self addSubview:self.kindView];
        [self setBackgroundColor:[UIColor grayColor]];
    }
    return self;
}


-(void)resetFrame:(CGRect)frame
{
    [super resetFrame:frame];
    [self.pokerView resetFrame:CGRectMake(0, 0, frame.size.width, 500.0)];
    [self.kindView resetFrame:CGRectMake(0, self.pokerView.bottom, self.pokerView.width, 60.0)];
    [self.advertisementView resetFrame:CGRectMake(0, self.kindView.bottom, self.kindView.width, 60.0)];
}





#pragma mark - Getter /  Setter
-(XHHomePokerView*)pokerView
{
    if (!_pokerView)
    {
        _pokerView = [[XHHomePokerView alloc]init];
    }
    return _pokerView;
}


-(XHHomeKindView *)kindView
{
    if (!_kindView)
    {
        _kindView = [[XHHomeKindView alloc]init];
    }
    return _kindView;
}


-(XHHomeAdvertisementView *)advertisementView
{
    if (!_advertisementView)
    {
        _advertisementView = [[XHHomeAdvertisementView alloc]init];
    }
    return _advertisementView;
}





@end
