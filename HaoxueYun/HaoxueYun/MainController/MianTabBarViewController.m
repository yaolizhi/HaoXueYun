//
//  MianTabBarViewController.m
//  ZhongBangShop
//
//  Created by Git on 2017/10/12.
//  Copyright © 2017年 XueHui. All rights reserved.
//

#import "MianTabBarViewController.h"
#import "XHLoginViewController.h"         //!< 登录
#import "XHHomeViewController.h"          //!< 首页
#import "XHStudyCenterViewController.h"   //!< 学习中心
#import "XHPersonCenterViewController.h"  //!< 我的
#import "XHNearbyViewController.h"        //!< 附近
#import "XHLoginViewController.h"
#import "XHPersonCenterViewController.h"
#import "TabBarItem.h"

#define kTabbarNormalTitle @[@"ico_shouye",@"ico_fujin123",@"ico_xuexi",@"ico_wo"]
#define kTabbarSelectedTitle @[@"ico_shouyecrt",@"ico_fujin123",@"ico_xuexicrt",@"ico_wocrt"]

@interface MianTabBarViewController ()
@end

@implementation MianTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTranslucent:NO];
    
    
    [self addsubView];
    
    
   
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)addsubView
{
    
#pragma mark 首页
    XHHomeViewController *home = [[XHHomeViewController alloc] init];
    [home setNavtionTitle:@"首页"];
    TabBarItem *imNoticeTabBarItem = [[TabBarItem alloc]initWithTitle:@"首页" imageName:@"ico_shouye" selectedImageName:@"ico_shouyecrt"];
    [home setTabBarItem:imNoticeTabBarItem];
    UINavigationController *imNoticeNavigation = [[UINavigationController alloc] initWithRootViewController:home];
    [self addChildViewController:imNoticeNavigation];


#pragma mark 附近
    XHNearbyViewController *nearby = [[XHNearbyViewController alloc] init];
    [nearby setNavtionTitle:@"附近"];
    TabBarItem *nearbyTabBarItem = [[TabBarItem alloc]initWithTitle:@"" imageName:@"ico_fujin123" selectedImageName:@"ico_fujin123"];
    [nearby setTabBarItem:nearbyTabBarItem];
    UINavigationController *nearbyNavigation = [[UINavigationController alloc] initWithRootViewController:nearby];
    
    [self addChildViewController:nearbyNavigation];
    
    
#pragma mark 学习中心
    XHStudyCenterViewController *educationCloud = [[XHStudyCenterViewController alloc] init];
    [educationCloud setNavtionTitle:@"学习中心"];
    [educationCloud  setHiddenItemType:LeftBaseNavigationItemType];
    //创建tabBarItem
    TabBarItem *educationCloudTabBarItem = [[TabBarItem alloc]initWithTitle:@"学习中心" imageName:@"ico_xuexi" selectedImageName:@"ico_xuexicrt"];
    [educationCloud setTabBarItem:educationCloudTabBarItem];
    UINavigationController *educationCloudNavigation = [[UINavigationController alloc] initWithRootViewController:educationCloud];
    [self addChildViewController:educationCloudNavigation];

#pragma mark 我的
    XHPersonCenterViewController *personalCenter = [[XHPersonCenterViewController alloc] init];
    [personalCenter setNavtionTitle:@"我的"];
    [personalCenter setHiddenItemType:LeftBaseNavigationItemType];
    //创建tabBarItem
    TabBarItem *personalCenterTabBarItem = [[TabBarItem alloc]initWithTitle:@"我的" imageName:@"ico_wo" selectedImageName:@"ico_wocrt"];
    [personalCenter setTabBarItem:personalCenterTabBarItem];
    UINavigationController *personalCenterNavigation = [[UINavigationController alloc] initWithRootViewController:personalCenter];
    [self addChildViewController:personalCenterNavigation];

    

}
#pragma mark  tabbarViewDelegate
-(void)setItemSelectIndex:(NSInteger)selectIndex
{
    self.selectedIndex=selectIndex;
}


@end
