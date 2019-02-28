//
//  MainRootControllerHelper.m
//  ZhongBangShop
//
//  Created by Git on 2017/11/1.
//  Copyright © 2017年 XueHui. All rights reserved.
//

#import "MainRootControllerHelper.h"
#import "XHGuideViewController.h"   //!< 引导视图控制器
#import "XHLoginViewController.h"   //!< 登陆视图控制器
#import "MainPreviewViewController.h" //!< 自动登录视图控制器
#import "MianTabBarViewController.h" //!<
#import "NSUserDefaults+UserInfo.h"

#import "AppDelegate.h"


@interface  MainRootControllerHelper()

@property(nonatomic,strong) MianTabBarViewController *mainTabBarViewController;

@end
@implementation MainRootControllerHelper

static MainRootControllerHelper *rootHelper = nil;

+ (instancetype)sharedRootHelperHelper
{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        rootHelper = [[self alloc]init];
        
    });
    
    return rootHelper;
}

-(void)isFirstStartWithWindow:(UIWindow*)window
{
    NSString *appversion = [NSUserDefaults objectItemForKey:KeyAppVersion];
    if ([[NSString safeString:appversion] isEqualToString:AppVersion])
    {
        MainPreviewViewController *pre = [[MainPreviewViewController alloc]init];
        [window setRootViewController:pre];
    }
    else
    {
        XHGuideViewController *mianViewController = [[XHGuideViewController alloc]init];
        [window setRootViewController:mianViewController];
    }
    
  
}
-(void)setMainTabBarViewControllerSelectedIndex:(NSInteger)selectedIndex
{
    [self.mainTabBarViewController setSelectedIndex:selectedIndex];
}



-(void)setAppVersion
{
    [NSUserDefaults setItemObject:AppVersion forKey:KeyAppVersion];
    [[MainRootControllerHelper sharedRootHelperHelper] isFirstStartWithWindow:kWindow];
}



-(void)rootHelperWith:(RootHelperType)type withController:(id)object
{
}

-(void)autoLoginWithWindow:(UIWindow*)window
{
    
}


@end
