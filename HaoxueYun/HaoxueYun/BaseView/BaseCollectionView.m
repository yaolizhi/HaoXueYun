//
//  BaseCollectionView.m
//  ZhongBangShop
//
//  Created by XueHui on 17/9/12.
//  Copyright © 2017年 姚立志. All rights reserved.
//

#import "BaseCollectionView.h"





@interface BaseCollectionView ()
@property (nonatomic,strong) BaseTipView *tipView; //!< 提示视图
@property (nonatomic,strong) NSMutableArray *dataSourceArray; //!< 数据源数组

@end



@implementation BaseCollectionView



-(instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self = [super initWithFrame:CGRectZero collectionViewLayout:layout];
    {
        [self setBackgroundColor:RGB(244.0, 244.0, 244.0)];
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        [self addSubview:self.tipView];
    }
    return self;
}

-(instancetype)initWithType:(UICollectionViewScrollDirection)type
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:type];
    self = [super initWithFrame:CGRectZero collectionViewLayout:layout];
    {
        [self setBackgroundColor:RGB(244.0, 244.0, 244.0)];
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        [self addSubview:self.tipView];
    }
    return self;
}




-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
    [self addSubview:self.tipView];
    [self.tipView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self setHidden:NO];
}


#pragma mark 设置头部和脚部的标题
-(void)setFooterTitle:(NSString*)title forState:(MJRefreshState)state
{
    [self.animateFooter setTitle:title forState:state];
}


#pragma mark 设置头部和脚部的标题
-(void)setHeaderTitle:(NSString*)title forState:(MJRefreshState)state
{
    [self.animateHeader setTitle:title forState:state];
}


#pragma mark 是否隐藏头部刷新，不调用该方法，默认为隐藏，调用该方法后即可显示
/**
 是否隐藏头部刷新，不调用该方法，默认为隐藏，调用该方法后即可显示
 -(void)refreshHeaderAction
 */
-(void)showRefresHeaderWithTarget:(id)target withSelector:(SEL)selector
{
    self.animateHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:selector];
    [self setHeader:self.animateHeader];
}




#pragma mark 设置脚部刷新
-(void)showRefresFooterWithTarget:(id)target withSelector:(SEL)selector;
{
    self.animateFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:selector];
    [self setFooter:self.animateFooter];
    
}


#pragma mark 项目中如果表数据源为空的时候，显示提示图标
-(void)tipViewWithArray:(NSMutableArray*)taskArray
{
    [self.dataSourceArray setArray:taskArray];
    ([self.dataSourceArray count] > 0) ? [self.tipView setHidden:YES] :[self.tipView setHidden:NO];
}


-(void)resetHeight:(CGFloat)height
{
    [self setHeight:height];
    
    [self.tipView setFrame:CGRectMake(0, 0, self.frame.size.width, height)];
}


#pragma mark 设置提醒类型、提醒标题、提醒图标
/**
 type设置当前的提示类型
 1.只有文字类型的提示
 2.文字和图标类型的提示
 
 tipTitle:提醒的标题
 tipImage:提醒的图片
 
 withSuperViewFrame:添加的父视图
 
 */
-(void)setTipType:(BaseTipViewType)type withTipTitle:(NSString*)tipTitle withTipImage:(NSString*)tipImage
{
    [self.tipView setTipType:type withTipTitle:tipTitle withTipImage:tipImage];
}
/**
 设置刷新状态主题色白色
 */
-(void)setAnimateHeaderThemeWhite
{
    UIImage *image = [UIImage imageNamed:MJRefreshSrcName(@"arrow_white.png")];
    if (!image)
    {
        image = [UIImage imageNamed:MJRefreshFrameworkSrcName(@"arrow_white.png")];
    }
    [self.animateHeader.arrowView setImage:image];
    self.animateHeader.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhite;
    self.animateHeader.stateLabel.textColor = kColor(whiteColor);
    self.animateHeader.lastUpdatedTimeLabel.textColor = kColor(whiteColor);
}

-(void)tipButtonAction:(BaseButtonControl*)sender
{
    [self beginRefreshing];
}

-(BaseTipView *)tipView
{
    if (_tipView == nil)
    {
        _tipView = [[BaseTipView alloc]init];
        [_tipView.tipButton addTarget:self action:@selector(tipButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_tipView setHidden:YES];
        [_tipView setItemColor:NO];
    }
    return _tipView;
}


-(NSMutableArray *)dataSourceArray
{
    if (_dataSourceArray == nil)
    {
        _dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
}
/**
 重新刷新数据
 */
-(void)refreshReloadData
{
    [self reloadData];
    ([self.dataSourceArray count] > 0) ? [self.tipView setHidden:YES] :[self.tipView setHidden:NO];
    [self.header endRefreshing];
    [self.footer endRefreshing];
}
/**
 重新刷新数据,不加载默认图片
 */
-(void)refreshReload
{
    [self reloadData];
    [self.header endRefreshing];
    [self.footer endRefreshing];
}
-(void)noMoreData
{
    [self reloadData];
    [self.header endRefreshing];
    [self.footer noticeNoMoreData];
    return;
}


-(void)setItemArray:(NSMutableArray*)itemArray
{  
    
}

-(NSMutableArray *)dataArray
{
    if (_dataArray == nil)
    {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


#pragma mark 进入刷新
/**
 开始刷新
 */
-(void)beginRefreshing
{
    [self.header beginRefreshing];
}






@end
