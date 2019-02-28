//
//  BaseViewController.h
//  TestNavegationBar
//
//  Created by 钧泰科技 on 2018/3/1.
//  Copyright © 2018年 juntaikeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationItem.h"
#import "BaseTableView.h"
#import "XHNetWorkConfig.h"


typedef void(^RefreshBlock)(BOOL isRefresh);

@interface BaseViewController : UIViewController

@property(nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,assign) CGFloat navBarBottom; //!< 导航栏底部坐标
@property (nonatomic,assign) CGFloat tabBarHeight; //!< tabbar的高度
@property(nonatomic,strong) BaseTableView *tableView;
@property (nonatomic,strong) XHNetWorkConfig *config; //!< 每个视图控制器中主要网络请求
@property (nonatomic,assign) int pageNumber; //!< 分页数据

@property(nonatomic,copy)RefreshBlock refreshBlock;//刷新回调

#pragma mark 初始化Tabbar自动隐藏
-(instancetype)initHiddenWhenPushHidden;



/**
 是否设置导航栏为绿色或者白色

 @param animated BOOL YES 为绿色 NO 为白色 （默认为白色）
 */
-(void)viewWillAppear:(BOOL)animated;


#pragma mark 隐藏导航栏

/**
 隐藏导航栏

 @param hidden 是否隐藏
 */
-(void)setNavtionHidden:(BOOL)hidden;



/**
 设置左右按钮的样式
 
 @param contentType 导航栏类型（图标、文字、图标加文字）
 @param itemType 左按钮或右按钮
 @param iconName 左右按钮图片名字
 @param title 左右按钮名字
 */
-(void)setItemContentType:(BaseNavigationItemContentType)contentType withItemType:(BaseNavigationItemType)itemType withIconName:(NSString*)iconName withTitle:(NSString*)title;



/**
自定义左右按钮

 @param itemType 自定义按钮
 @param object 自定义视图对象
 */
-(void)setItemWithType:(BaseNavigationItemType)itemType withObject:(UIView*)object;

/**
 自定导航栏中间按钮
 
 @param view 自定义视图对象
 */
-(void)setItemTitleView:(UIView*)view;


/**
 设置导航栏背景颜色

 @param color 颜色
 */
-(void)setNavBackgroundColor:(UIColor *)color;

/**
 设置导航栏底部横线显示
 */
-(void)setNavigationClipsToBounds:(BOOL)isClips;
/**
 设置导航栏标题

 @param title 标题
 */
-(void)setNavtionTitle:(NSString *)title;

/**
 设置导航栏标题颜色

 @param color 颜色
 */
-(void)setNavTitleColor:(UIColor *)color;

/**
 设置导航栏标题和字体大小

 @param title 标题
 @param fontSize 字体大小
 */
-(void)setNavTitle:(NSString *)title withFontSize:(CGFloat)fontSize;
/**
 设置导航栏字体大小

 */
-(void)setNavFontSize:(CGFloat)fontSize;
/**
 隐藏左、右按钮

 @param itemType 左、右按钮类型
 */
-(void)setHiddenItemType:(BaseNavigationItemType)itemType;

#pragma mark 设置隐藏左右按钮隐藏并CGRectZero

/**
 隐藏按钮是否也设置CGRectZero
 
 @param itemType BaseNavigationItemType
 @param zero BOOL
 */
-(void)setHiddenItemType:(BaseNavigationItemType)itemType withZero:(BOOL)zero;

#pragma mark 设置显示左右按钮
-(void)setShowItemType:(BaseNavigationItemType)itemType;

#pragma mark 设置左右按钮重置Frame
/**
 重置Frame
 
 @param itemType BaseNavigationItemType
 @param frame frame
 */
-(void)resetItemType:(BaseNavigationItemType)itemType withFrame:(CGRect)frame;


/**
 左侧按钮方法

 @param leftItem 左侧按钮对象
 */
-(void)leftItemClickMethod:(BaseNavigationItem *)leftItem;

/**
 右侧按钮方法

 @param rightItem 右侧按钮对象
 */
-(void)rightItemClickMethod:(BaseNavigationItem *)rightItem;


/**
 设置左右按钮字体颜色

 */
-(void)setItemTextColor:(UIColor*)color withItemType:(BaseNavigationItemType)type;
/**
设置左右图标
 */
-(void)setItemImageName:(NSString *)name withItemType:(BaseNavigationItemType)type;
/**
 设置左右标题
 */
-(void)setItemText:(NSString *)text withItemType:(BaseNavigationItemType)type;
/**
 设置左右点击状态
 */
-(void)setItemSelect:(BOOL)select withItemType:(BaseNavigationItemType)type;

/**
 添加子视图方法

 @param subview 是否添加子视图
 */
-(void)addSubViews:(BOOL)subview;



/**
 开始网络请求
 @param type 刷新类型
 */
-(void)startNetwork:(NSInteger)type;


/**
 单元测试

 @param unit 是否开启
 */
-(void)unitTest:(BOOL)unit;



/**
 设置控件的颜色

 @param color 是否设置控件的颜色
 */
-(void)setItemColor:(BOOL)color;

@end
