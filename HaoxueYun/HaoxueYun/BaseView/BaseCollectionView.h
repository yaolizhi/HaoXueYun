//
//  BaseCollectionView.h
//  ZhongBangShop
//
//  Created by XueHui on 17/9/12.
//  Copyright © 2017年 姚立志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTipView.h"


@interface BaseCollectionView : UICollectionView




@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) MJRefreshNormalHeader *animateHeader; //!< 头部
@property (nonatomic,strong) MJRefreshAutoNormalFooter *animateFooter; //!< 脚部

-(instancetype)init;
-(instancetype)initWithType:(UICollectionViewScrollDirection)type;




/**
 重置高度
 @param height 重置的高度
 */
-(void)resetHeight:(CGFloat)height;


#pragma mark 重置frame
/**
 重置Frame
 @param frame 数据
 */
-(void)resetFrame:(CGRect)frame;




#pragma mark 设置头部和脚部的标题
/**
 设置头部和脚部的标题

 @param title 刷新标题
 @param state MJRefreshState类型枚举类型
 */
-(void)setFooterTitle:(NSString*)title forState:(MJRefreshState)state;
/**
 设置头部刷新
 
 @param title 刷新标题
 @param state MJRefreshState类型枚举类型
 */
-(void)setHeaderTitle:(NSString*)title forState:(MJRefreshState)state;

#pragma mark 设置头部刷新

/**
 设置头部刷新
 
 @param target 头部刷新响应对象
 @param selector 头部刷新响应方法
 */
-(void)showRefresHeaderWithTarget:(id)target withSelector:(SEL)selector;




#pragma mark 设置脚部刷新
/**
 是否隐藏头部刷新，不调用该方法，默认为隐藏，调用该方法后即可显示
 -(void)refreshFooterAction
 @param target 方法响应对象
 @param selector 响应方法
 */
-(void)showRefresFooterWithTarget:(id)target withSelector:(SEL)selector;


#pragma mark 项目中如果表数据源   为空的时候，显示提示图标
/**
 如果数组为空时显示提示图标

 @param taskArray 数据源数组
 */
-(void)tipViewWithArray:(NSMutableArray*)taskArray;

#pragma mark 设置提醒类型、提醒标题、提醒图标
/**
 设置提醒类型、提醒标题、提醒图标

 @param type BaseTipViewType
 @param tipTitle 提示标题
 @param tipImage 提示图标
 */
-(void)setTipType:(BaseTipViewType)type withTipTitle:(NSString*)tipTitle withTipImage:(NSString*)tipImage;
/**
 设置刷新状态主题色白色
 */
-(void)setAnimateHeaderThemeWhite;
#pragma mark 刷新数据但会停止等待指示器
/**
 刷新数据但会停止等待指示器
 */
-(void)refreshReloadData;
/**
 重新刷新数据,不加载默认图片
 */
-(void)refreshReload;

#pragma mark 设置无数据提示
/**
 刷新数据但会停止等待指示器
 */
-(void)noMoreData;



/**
 设置数据源数组，数组为空或者nil时，会提示提醒图片

 @param itemArray 数据源数组
 */
-(void)setItemArray:(NSMutableArray*)itemArray;

#pragma mark 进入刷新
/**
 开始刷新
 */
-(void)beginRefreshing;




@end

