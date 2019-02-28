//
//  BaseTableView.m
//  liaotian
//
//  Created by XueHui on 17/7/10.
//  Copyright © 2017年 姚立志. All rights reserved.
//

#import "BaseTableView.h"


@interface BaseTableView ()
@property (nonatomic,strong) BaseTipView *tipView; //!< 提示视图
@property (nonatomic,strong) NSMutableArray *dataSourceArray; //!< 数据源数组



@end

@implementation BaseTableView



-(instancetype)init
{
    self = [super initWithFrame:CGRectZero style:UITableViewStylePlain];
    if (self)
    {
        //去掉留白方法
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            self.estimatedRowHeight = 0;
            self.estimatedSectionHeaderHeight = 0;
            self.estimatedSectionFooterHeight = 0;
        }
        
        [self setBackgroundColor:RGB(244.0, 244.0, 244.0)];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        [self addSubview:self.tipView];
        [self.tipView resetFrame:CGRectZero];
    }
    return self;
}



-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self)
    {
        //去掉留白方法
        if (@available(iOS 11.0, *))
        {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            self.estimatedRowHeight = 0;
            self.estimatedSectionHeaderHeight = 0;
            self.estimatedSectionFooterHeight = 0;
        }
        
        [self setBackgroundColor:RGB(244.0, 244.0, 244.0)];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        [self addSubview:self.tipView];
        [self.tipView resetFrame:CGRectMake(0, 0, SCREEN_WIDTH, frame.size.height)];
    }
    return self;
}


-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
    [self.tipView resetFrame:CGRectMake(0, 0, SCREEN_WIDTH,frame.size.height)];
    
}

/**
 数据源数组
 
 @param object 数据源数组
 */
-(void)setItemObject:(id)object
{
    
}



#pragma mark 进入刷新

/**
 开始刷新
 */
-(void)beginRefreshing
{
    [self.header beginRefreshing];
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
/**
 是否隐藏头部刷新，不调用该方法，默认为隐藏，调用该方法后即可显示
  -(void)refreshFooterAction
 */
-(void)showRefresFooterWithTarget:(id)target withSelector:(SEL)selector;
{
    self.animateFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:selector];
    [self setFooter:self.animateFooter];
    
}


#pragma mark 项目中如果表数据源为空的时候，显示提示图标
/**
 如果数组为空时显示提示图标
 在表代理方法"numberOfRowsInSection"中添加
 */
-(void)tableTipViewWithArray:(NSMutableArray*)taskArray
{
    [self setDataSourceArray:taskArray];
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


-(void)setTipHeight:(CGFloat)height
{
    [self.tipView setTipHeight:height];
    
    [self.tipView setItemColor:NO];
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
    [self.header endRefreshing];
    [self.footer endRefreshing];
    
    [self.dataSourceArray count] > 0 ? [self.tipView setHidden:YES] :[self.tipView setHidden:NO];
}
/**
 重新刷新数据,数据为空不显示提醒图片
 */
-(void)refreshReload
{
    [self reloadData];
    
    [self.header endRefreshing];
    [self.footer endRefreshing];
}
-(void)noMoreData
{
    [self refreshReloadData];
    [self.footer noticeNoMoreData];
}

-(void)tipButtonAction:(BaseButtonControl*)sender
{
    [self beginRefreshing];
}

/**
 刷新分组
 
 @param sectionsIndex 要刷新的分组的index而不是“NSIndexSet”
 @param animation UITableViewRowAnimation 动画类型
 */
-(void)reloadSectionsWithIndex:(NSInteger )sectionsIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadSections:[NSIndexSet indexSetWithIndex:sectionsIndex] withRowAnimation:animation];
}



-(void)unitTest:(BOOL)unit
{
    
}
@end
