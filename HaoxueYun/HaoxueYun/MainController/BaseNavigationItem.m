//
//  BaseNavigationItem.m
//  TestNavegationBar
//
//  Created by 钧泰科技 on 2018/3/1.
//  Copyright © 2018年 juntaikeji. All rights reserved.
//

#import "BaseNavigationItem.h"
#import "UIView+Frame.h"

@interface BaseNavigationItem ()

@property (nonatomic,assign) CGRect BaseNavigationFrame; //!< 记录当前导航条的Farme，为了后面设置图标和标题使用

@property (nonatomic,strong) UIImageView *iconImageView; //!< 图标
@property (nonatomic,strong) UILabel *titleLabel; //!< 标题标签

@end


@implementation BaseNavigationItem

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        [self setBaseNavigationFrame:frame];
        [self addSubview:self.iconImageView];
        [self addSubview:self.titleLabel];
        
        [self setItemColor:NO];
    }
    return self;
}


-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
    [self.titleLabel setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self.iconImageView setFrame:CGRectZero];
}


#pragma mark 隐藏导航栏
-(void)navtionHidden:(BOOL)hidden
{
    
}
#pragma mark 设置标题
-(void)setTextColor:(UIColor*)color
{
    [self.titleLabel setTextColor:color];
}
-(void)setImageName:(NSString *)name
{
    self.iconImageView.image=[UIImage imageNamed:name];
}
-(void)setText:(NSString *)text
{
    [self.titleLabel setText:text];
}
-(void)setItemContentType:(BaseNavigationItemContentType)contentType withItemType:(BaseNavigationItemType)itemType withIconName:(NSString*)iconName withTitle:(NSString*)title
{
    [self.titleLabel setHidden:YES];
    [self.iconImageView setHidden:YES];
    [self setHidden:NO];
    switch (contentType) {
        case NavigationTitleType:
            
        {
            switch (itemType) {
                case LeftBaseNavigationItemType:
                {
                    [self.titleLabel setHidden:NO];
                    [self.titleLabel setFrame:CGRectMake(5, 0, self.BaseNavigationFrame.size.width+5, self.BaseNavigationFrame.size.height)];
                    [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
                    [self.titleLabel setText:title];
                }
                    break;
                    
                case RightBaseNavigationItemType:
                {
                    [self.titleLabel setHidden:NO];
                    [self.titleLabel setFrame:CGRectMake(5, 0, self.BaseNavigationFrame.size.width, self.BaseNavigationFrame.size.height)];
                    [self.titleLabel setTextAlignment:NSTextAlignmentRight];
                    [self.titleLabel setText:title];
                }
                    break;
                
            }
        }
            break;
            
        case NavigationIconype:
        {
            switch (itemType) {
                case LeftBaseNavigationItemType:
                    
                {
                    [self.iconImageView setHidden:NO];
                    [self.iconImageView setImage:[UIImage imageNamed:(iconName ? iconName : nil)]];
                    [self.iconImageView setFrame:CGRectMake(0, (44-20)/2.0, 10.0, 20)];
                }
                    break;
                case RightBaseNavigationItemType:
                {
                    [self.iconImageView setHidden:NO];
                    [self.iconImageView setImage:[UIImage imageNamed:(iconName ? iconName : nil)]];
                    [self.iconImageView setFrame:CGRectMake(self.BaseNavigationFrame.size.width-15, (44-20)/2.0, 20, 20)];
                }
                    break;
                    
            }
        }
            break;
            case NavigationIconAndTitle:
        {
            switch (itemType) {
                case LeftBaseNavigationItemType:
                    
                {
                    [self.iconImageView setHidden:NO];
                    
                    [self.iconImageView setImage:[UIImage imageNamed:(iconName ? iconName : nil)]];
                    [self.iconImageView setFrame:CGRectMake(0, (44-20)/2.0, 10.0, 20)];
                    
                    [self.titleLabel setHidden:NO];
                    
                    [self.titleLabel setFrame:CGRectMake(self.iconImageView.right+5, 0, (self.BaseNavigationFrame.size.width-self.iconImageView.right)+5, self.BaseNavigationFrame.size.height)];
                    [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
                    [self.titleLabel setText:title];
                }
                    break;
                    
                case RightBaseNavigationItemType:
                {
                    [self.iconImageView setHidden:NO];
                    [self.iconImageView setImage:[UIImage imageNamed:(iconName ? iconName : nil)]];
                    [self.iconImageView setFrame:CGRectMake(self.BaseNavigationFrame.size.width-15, (44-20)/2.0, 20, 20)];
                    [self.titleLabel setHidden:NO];
                    [self.titleLabel setFrame:CGRectMake(0, 0, (self.BaseNavigationFrame.size.width-20), self.BaseNavigationFrame.size.height)];
                    [self.titleLabel setTextAlignment:NSTextAlignmentRight];
                    [self.titleLabel setText:title];
                }
                    break;
                    
            }
        }
            break;
    }
}

-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView=[[UIImageView alloc] init];
        [_iconImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _iconImageView;
}
-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel=[[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:15]];
    }
    return _titleLabel;
}

-(void)setItemColor:(BOOL )color
{
    if (color)
    {
        [self.iconImageView setBackgroundColor:[UIColor greenColor]];
        [self.titleLabel setBackgroundColor:[UIColor orangeColor]];
        [self setBackgroundColor:[UIColor redColor]];
    }
   
}



@end
