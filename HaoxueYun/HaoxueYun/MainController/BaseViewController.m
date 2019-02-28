//
//  BaseViewController.m
//  TestNavegationBar
//
//  Created by 钧泰科技 on 2018/3/1.
//  Copyright © 2018年 juntaikeji. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()

@property (nonatomic,strong) BaseNavigationItem *leftButtonItem; //!< 左按钮
@property (nonatomic,strong) BaseNavigationItem *rightButtonItem; //!< 右按钮
@end

@implementation BaseViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
         
    }
    return self;
}


- (BOOL)shouldAutorotate
{
    return NO;
}

-(instancetype)initHiddenWhenPushHidden
{
    self = [super init];
    if (self)
    {
        [self setHidesBottomBarWhenPushed:YES];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavtionHidden:NO];
    self.view.backgroundColor=RGB(244, 244, 244);
    [self setNavFontSize:16.0];
    //去掉留白方法
    if (@available(iOS 11.0, *)){}
    else
    {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self setItemContentType:NavigationIconype withItemType:LeftBaseNavigationItemType withIconName:@"arr_back" withTitle:nil];
    [self setNavTitleColor:[UIColor blackColor]];
    [self addSubViews:YES];
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self setNavtionHidden:NO];
    [self setNavigationClipsToBounds:NO];
    if (animated)
    {
        [self setNavBackgroundColor:[UIColor whiteColor]];
        [self setNavTitleColor:[UIColor blackColor]];
        [self setItemImageName:@"arr_back" withItemType:LeftBaseNavigationItemType];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
    else
    {
        [self setNavBackgroundColor:MainColor];
        [self setNavTitleColor:[UIColor whiteColor]];
        [self setNavigationClipsToBounds:YES];
        [self setItemImageName:@"ico_back_w" withItemType:LeftBaseNavigationItemType];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
}






#pragma mark- 隐藏导航栏
-(void)setNavtionHidden:(BOOL)hidden
{
    [self.navigationController setNavigationBarHidden:hidden animated:YES];
    self.navigationController.navigationBar.translucent = NO;
}


#pragma mark 设置左右按钮的样式
-(void)setItemContentType:(BaseNavigationItemContentType)contentType withItemType:(BaseNavigationItemType)itemType withIconName:(NSString*)iconName withTitle:(NSString*)title
{
    switch (itemType)
    {
        case LeftBaseNavigationItemType:
        {
            [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:self.leftButtonItem]];
            [self.leftButtonItem setItemContentType:contentType withItemType:LeftBaseNavigationItemType withIconName:iconName withTitle:title];
            [self.leftButtonItem addTarget:self action:@selector(leftItemClickMethod:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
            
        case RightBaseNavigationItemType:
        {
            [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:self.rightButtonItem]];
            [self.rightButtonItem setItemContentType:contentType withItemType:RightBaseNavigationItemType withIconName:iconName withTitle:title];
            [self.rightButtonItem addTarget:self action:@selector(rightItemClickMethod:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
    }
}


-(void)setItemWithType:(BaseNavigationItemType)itemType withObject:(UIView*)object
{
    switch (itemType)
    {
        case LeftBaseNavigationItemType:
        {
            [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:object]];
            
        }
            break;
            
        case RightBaseNavigationItemType:
        {
            [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:object]];
        }
            break;
    }
}


/**
 自定导航栏中间按钮
 
 @param view 自定义视图对象
 */
-(void)setItemTitleView:(UIView*)view
{
    [self.navigationItem setTitleView:view];
}
 

#pragma mark 设置隐藏左右按钮
-(void)setHiddenItemType:(BaseNavigationItemType)itemType
{
    switch (itemType)
    {
        case LeftBaseNavigationItemType:
        {
            [self.leftButtonItem setHidden:YES];
        }
            break;
            
        case RightBaseNavigationItemType:
        {
            [self.rightButtonItem setHidden:YES];
        }
            break;
    }
}
#pragma mark 设置显示左右按钮
-(void)setShowItemType:(BaseNavigationItemType)itemType
{
    switch (itemType)
    {
        case LeftBaseNavigationItemType:
        {
            [self.leftButtonItem setHidden:NO];
        }
            break;
            
        case RightBaseNavigationItemType:
        {
            [self.rightButtonItem setHidden:NO];
        }
            break;
    }
}


#pragma mark 设置隐藏左右按钮隐藏并CGRectZero

/**
 隐藏按钮是否也设置CGRectZero

 @param itemType BaseNavigationItemType
 @param zero BOOL
 */
-(void)setHiddenItemType:(BaseNavigationItemType)itemType withZero:(BOOL)zero
{
    switch (itemType)
    {
        case LeftBaseNavigationItemType:
        {
            [self.leftButtonItem setHidden:YES];
            if (zero)
            {
                [self.leftButtonItem setFrame:CGRectZero];
            }
            
        }
            break;
            
        case RightBaseNavigationItemType:
        {
            [self.rightButtonItem setHidden:YES];
            if (zero)
            {
                [self.rightButtonItem setFrame:CGRectZero];
            }
            
        }
            break;
    }
}




#pragma mark 设置左右按钮重置Frame
/**
 重置Frame

 @param itemType BaseNavigationItemType
 @param frame frame
 */
-(void)resetItemType:(BaseNavigationItemType)itemType withFrame:(CGRect)frame
{
    switch (itemType)
    {
        case LeftBaseNavigationItemType:
        {
            [self.leftButtonItem setHidden:NO];
            [self.leftButtonItem resetFrame:frame];
            
        }
            break;
            
        case RightBaseNavigationItemType:
        {
            [self.rightButtonItem setHidden:NO];
            [self.rightButtonItem resetFrame:frame];
            
        }
            break;
    }
}

#pragma mark 设置导航栏背景颜色
-(void)setNavBackgroundColor:(UIColor *)color
{
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = color;
}


#pragma mark- 设置导航栏底部横线显示
-(void)setNavigationClipsToBounds:(BOOL)isClips
{
    if (isClips)
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
    else
    {
       [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
       [self.navigationController.navigationBar setShadowImage:nil];
        
    }
}



#pragma mark 设置导航栏标题
-(void)setNavtionTitle:(NSString *)title
{
     self.navigationItem.title=title;
}
#pragma mark 设置导航栏标题颜色
-(void)setNavTitleColor:(UIColor *)color
{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:color}];
}
#pragma mark 设置导航栏标题和字体大小
-(void)setNavTitle:(NSString *)title withFontSize:(CGFloat)fontSize
{
    self.navigationItem.title=title;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
}
#pragma mark 设置导航栏字体大小
-(void)setNavFontSize:(CGFloat)fontSize
{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
}
#pragma mark 左侧按钮方法
-(void)leftItemClickMethod:(BaseNavigationItem *)leftItem
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 设置左右标题的颜色
-(void)setItemTextColor:(UIColor*)color withItemType:(BaseNavigationItemType)type
{
    switch (type)
    {
        case LeftBaseNavigationItemType:
        {
             [self.leftButtonItem setTextColor:color];
        }
            break;
            
        case RightBaseNavigationItemType:
        {
            [self.rightButtonItem setTextColor:color];
        }
            break;
    }
   
}
#pragma mark 设置左右图标
-(void)setItemImageName:(NSString *)name withItemType:(BaseNavigationItemType)type
{
    switch (type) {
        case LeftBaseNavigationItemType:
        {
            [self.leftButtonItem setImageName:name];
        }
            break;
            
        case RightBaseNavigationItemType:
        {
            [self.rightButtonItem setImageName:name];
        }
            break;
    }
    
}
#pragma mark 设置左右标题
-(void)setItemText:(NSString *)text withItemType:(BaseNavigationItemType)type
{
    switch (type)
    {
        case LeftBaseNavigationItemType:
        {
            [self.leftButtonItem setText:text];
        }
            break;
            
        case RightBaseNavigationItemType:
        {
            [self.rightButtonItem setText:text];
        }
            break;
    }
}
#pragma mark 设置左右点击状态
-(void)setItemSelect:(BOOL)select withItemType:(BaseNavigationItemType)type
{
    switch (type)
    {
        case LeftBaseNavigationItemType:
        {
            [self.leftButtonItem setSelected:select];
        }
            break;
            
        case RightBaseNavigationItemType:
        {
            [self.rightButtonItem setSelected:select];
        }
            break;
    }
}

#pragma mark 右侧按钮方法
-(void)rightItemClickMethod:(BaseNavigationItem *)rightItem
{
    
}
-(BaseNavigationItem *)leftButtonItem
{
    if (!_leftButtonItem)
    {
        _leftButtonItem=[[BaseNavigationItem alloc] initWithFrame:CGRectMake(0, 20, 80.0, 44)];
        
    }
    return _leftButtonItem;
}
-(BaseNavigationItem *)rightButtonItem
{
    if (!_rightButtonItem)
    {
        _rightButtonItem = [[BaseNavigationItem alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-70, 20, 80, 44)];
    }
    return _rightButtonItem;
}

-(NSMutableArray *)dataArray
{
    if (_dataArray==nil)
    {
        _dataArray=[[NSMutableArray alloc] init];
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)addSubViews:(BOOL)subview
{
    
}


/**
 返回导航栏底部坐标

 @return 返回导航栏底部坐标
 */
- (CGFloat)navBarBottom
{
    return self.navigationController.navigationBar.bottom;
}

/**
 获取tabbar的高度

 @return 获取tabbar的高度
 */
- (CGFloat)tabBarHeight
{
    return self.tabBarController.tabBar.height;
}


- (BaseTableView*)tableView
{
    if (!_tableView)
    {
        _tableView = [[BaseTableView alloc]init];
        
    }
    return _tableView;
}

-(XHNetWorkConfig *)config
{
    if (!_config)
    {
        _config = [[XHNetWorkConfig alloc]init];
    }
    return _config;
}

@end
