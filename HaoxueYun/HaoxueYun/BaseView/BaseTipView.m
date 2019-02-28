//
//  BaseTipView.m
//  BaseTipView
//
//  Created by XueHui on 17/7/31.
//  Copyright © 2017年 姚立志. All rights reserved.
//

#import "BaseTipView.h"




@interface BaseTipView ()

@property (nonatomic,strong) UILabel *tipLabel; //!< 提示标签
@property (nonatomic,assign) CGRect tipFrame; //!< 当前视图的Frame

@end

@implementation BaseTipView





- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setHidden:YES];
        [self addSubview:self.tipButton];
        [self setItemColor:NO];
        [self setBackgroundColor:RGB(244, 244, 244)];
    }
    return self;
}


-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
    [self setTipFrame:frame];
    [self.tipButton setCenter:CGPointMake(self.tipFrame.size.width/2.0, self.tipFrame.size.height/2.0)];
    [self.tipButton setItemColor:NO];
    
    
}

#pragma mark 设置提醒类型、提醒标题、提醒图标
/**
 type设置当前的提示类型
 1.只有文字类型的提示
 2.文字和图标类型的提示
 
 tipTitle:提醒的标题
 tipImage:提醒的图片
 
 superView:添加的父视图
 
 */
-(void)setTipType:(BaseTipViewType)type withTipTitle:(NSString*)tipTitle withTipImage:(NSString*)imageName
{
    NSLog(@"%f",self.height);
    
    
    switch (type)
    {
        case TipTitleType:
        {
            [self.tipButton resetFrame:CGRectMake(10.0, (self.height-150)/2.0, SCREEN_WIDTH-20.0, 150.0)];
            [self.tipButton setTitleEdgeFrame:CGRectMake(0, 0, self.tipButton.width, self.tipButton.height) withNumberType:0 withAllType:NO];
            [self.tipButton setText:tipTitle withNumberType:0 withAllType:NO];
           
        }
            break;
        case TipTitleAndTipImage:
        {
            [self.tipButton resetFrame:CGRectMake(10.0, (self.height-150)/2.0, SCREEN_WIDTH-20.0, 150.0)];
            [self.tipButton setImageEdgeFrame:CGRectMake(0, 0, self.tipButton.width, 120) withNumberType:0 withAllType:NO];
            [self.tipButton setTitleEdgeFrame:CGRectMake(0, 120.0, self.tipButton.width, 30.0) withNumberType:0 withAllType:NO];
            [self.tipButton setText:tipTitle withNumberType:0 withAllType:NO];
            [self.tipButton setText:tipTitle withNumberType:0 withAllType:NO];
            [self.tipButton setImage:imageName withNumberType:0 withAllType:NO];
        }
            break;
        case TipImage:
        {
            [self.tipButton resetFrame:CGRectMake(10.0, (self.height-150)/2.0, SCREEN_WIDTH-20.0, 150.0)];
            [self.tipButton setImageEdgeFrame:CGRectMake(0, (self.tipButton.height-150.0)/2.0, self.tipButton.width, 150.0) withNumberType:0 withAllType:NO];
            [self.tipButton setImage:imageName withNumberType:0 withAllType:NO];
        }
            break;
    }
    
    
}


#pragma mark - Getter / Setter
-(BaseButtonControl *)tipButton
{
    if (_tipButton == nil)
    {
        _tipButton = [[BaseButtonControl alloc]init];
        [_tipButton setNumberImageView:1];
        [_tipButton setNumberLabel:1];
        [_tipButton setTextAlignment:NSTextAlignmentCenter withNumberType:0 withAllType:NO];
        [_tipButton setFont:FontLevel2 withNumberType:0 withAllType:NO];
        [_tipButton setTextColor:[UIColor grayColor] withTpe:0 withAllType:NO];
        [_tipButton setNumberOfLines:0 withTpe:0 withAllType:NO];
        [_tipButton setImageContentMode:UIViewContentModeScaleAspectFit withNumberType:0 withAllType:NO];
        [_tipButton setItemColor:NO];
    }
    return _tipButton;
}


-(void)setTipHeight:(CGFloat)height
{
    [self.tipButton setY:height];
}


-(void)setItemColor:(BOOL)color
{
    if (color)
    {
        [self setBackgroundColor:[UIColor orangeColor]];
        [self.tipButton setBackgroundColor:[UIColor purpleColor]];
    }
}






@end
