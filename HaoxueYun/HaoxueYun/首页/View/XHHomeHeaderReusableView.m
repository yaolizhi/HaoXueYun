//
//  XHHomeHeaderReusableView.m
//  HaoxueYun
//
//  Created by mac on 2019/2/27.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import "XHHomeHeaderReusableView.h"


@interface XHHomeHeaderReusableView ()

@property (nonatomic,strong) UILabel *titleLabel; //!< 标题标签
@property (nonatomic,strong) XHHomeHeaderView *headerView; //!< 头部视图


@end


@implementation XHHomeHeaderReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor greenColor]];
        [self addSubview:self.headerView];
    }
    return self;
}


- (void)setHeaderItemFrame:(XHHomeFrame *)itemFrame
{
    switch (itemFrame.model.type)
    {
        case XHHomeHeaderType:
        {
            [self.headerView resetFrame:CGRectMake(0, 0, itemFrame.itemSize.width, 620.0)];
        }
            break;
        case XHHomeIntroducetType:
        {
            
        }
            break;
        case XHHomeInterestType:
        {
            
        }
            break;
    }
}




#pragma mark - Getter /  Setter
-(XHHomeHeaderView *)headerView
{
    if (!_headerView)
    {
        _headerView = [[XHHomeHeaderView alloc]init];
    }
    return _headerView;
}



@end
