//
//  XHTreatyViewController.m
//  HaoxueYun
//
//  Created by mac on 2018/6/11.
//  Copyright © 2018年 Yaolizhi. All rights reserved.
//

#import "XHTreatyViewController.h"
#import "BaseWebView.h"


@interface XHTreatyViewController () 

@property (nonatomic,strong) BaseWebView *webView;


@end

@implementation XHTreatyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)addSubViews:(BOOL)subview
{
    if (subview)
    {
        [self.view addSubview:self.webView];
        [self.webView resetFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.navBarBottom)];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServiceBaseUrl,self.url]]]];
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}


-(BaseWebView *)webView
{
    if (!_webView)
    {
        _webView = [[BaseWebView alloc]initWithDelegate:self];
    }
    return _webView;
}





@end
