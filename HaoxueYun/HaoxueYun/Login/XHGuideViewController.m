//
//  XHGuideViewController.m
//  daycareParent
//
//  Created by Git on 2017/11/30.
//  Copyright © 2017年 XueHui. All rights reserved.
//

#import "XHGuideViewController.h"
#import "XHGuideViewContentView.h"



@interface XHGuideViewController ()

@property (nonatomic,strong) XHGuideViewContentView *contentView; //!< 滚动视图
@property (nonatomic,strong) BaseButtonControl *overleapControl; //!< 跳过按钮

@end




@implementation XHGuideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavtionHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(void)addSubViews:(BOOL)subview
{
    if (subview)
    {
        [self.view addSubview:self.contentView];
        [self.view addSubview:self.overleapControl];
        [self.overleapControl resetFrame:CGRectMake(SCREEN_WIDTH-70.0, 50.0, 50.0, 23.0)];
        [self.overleapControl setTitleEdgeFrame:CGRectMake(0, 0, self.overleapControl.width, self.overleapControl.height) withNumberType:0 withAllType:NO];
        [self.overleapControl setLayerCornerRadius:(self.overleapControl.height/2.0) withMasksToBounds:YES];
        //添加数据源数据
        [self.contentView resetFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        for (int i = 1 ; i <= 4; i++)
        {
            NSString *imageName = [NSString stringWithFormat:@"guid%d.jpg",i];
            [self.dataArray addObject:imageName];
        }
        [self.contentView setItemArray:self.dataArray];
    }
}


#pragma mark - Action Method
-(void)overleapControlAction:(BaseButtonControl*)sender
{
    [[MainRootControllerHelper sharedRootHelperHelper] setAppVersion];
}



#pragma mark - Getter /  Setter
-(XHGuideViewContentView *)contentView
{
    if (_contentView == nil)
    {
        _contentView = [[XHGuideViewContentView alloc]init];
    }
    return _contentView;
}


-(BaseButtonControl *)overleapControl
{
    if (!_overleapControl)
    {
        _overleapControl = [[BaseButtonControl alloc]init];
        [_overleapControl setNumberLabel:1];
        [_overleapControl setText:@"跳过" withNumberType:0 withAllType:NO];
        [_overleapControl setFont:[UIFont systemFontOfSize:12.0] withNumberType:0 withAllType:NO];
        [_overleapControl setTextAlignment:NSTextAlignmentCenter withNumberType:0 withAllType:NO];
        [_overleapControl setTextColor:[UIColor whiteColor] withTpe:0 withAllType:NO];
        [_overleapControl setBackgroundColor:LineViewColor];
        [_overleapControl addTarget:self action:@selector(overleapControlAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _overleapControl;
}



@end
