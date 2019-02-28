//
//  MainPreviewViewController.m
//  daycareParent
//
//  Created by Git on 2017/12/26.
//  Copyright © 2017年 XueHui. All rights reserved.
//

#import "MainPreviewViewController.h"
#import "XHLoginViewController.h"
#import "MianTabBarViewController.h"
#import "ToadyExtensionOpenUrlHelper.h"

@interface MainPreviewViewController ()


@property (nonatomic,strong) UIImageView *backGroundImageView;  //!< 背景视图

@end

@implementation MainPreviewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.backGroundImageView];
    [self automaticLogin:YES];
    
    [self cancelPerformRequestsWithTarget:self];
    [self performSelector:@selector(tipControlAction) withObject:@"显示首页" afterDelay:8];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark - Private Method
-(void)tipControlAction
{
    MianTabBarViewController *main=[[MianTabBarViewController alloc] init];
    [kWindow setRootViewController:main];
}


-(void)cancelPerformRequestsWithTarget:(id)target
{
    [MainPreviewViewController cancelPreviousPerformRequestsWithTarget:target];
}


#pragma mark - Getter /  Setter
-(UIImageView *)backGroundImageView
{
    if (!_backGroundImageView)
    {
        _backGroundImageView = [[UIImageView alloc]initWithFrame:WindowScreen];
        [_backGroundImageView setUserInteractionEnabled:YES];
        [_backGroundImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_backGroundImageView setImage:[UIImage imageNamed:@"main"]];
    }
    return _backGroundImageView;
}




#pragma mark - NetWork Method
-(void)automaticLogin:(BOOL)autoLogin
{
    
}











@end
