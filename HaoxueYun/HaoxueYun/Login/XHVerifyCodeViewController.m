//
//  XHVerifyCodeViewController.m
//  HaoxueYun
//
//  Created by mac on 2018/6/9.
//  Copyright © 2018年 Yaolizhi. All rights reserved.
//

#import "XHVerifyCodeViewController.h"



@interface XHVerifyCodeViewController ()

@end




@implementation XHVerifyCodeViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setNavigationClipsToBounds:NO];

   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self setNavigationClipsToBounds:YES];
}


@end
