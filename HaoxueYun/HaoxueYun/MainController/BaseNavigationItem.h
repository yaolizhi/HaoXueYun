//
//  BaseNavigationItem.h
//  TestNavegationBar
//
//  Created by 钧泰科技 on 2018/3/1.
//  Copyright © 2018年 juntaikeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationItem : UIControl

typedef NS_ENUM(NSInteger,BaseNavigationItemContentType)
{
    NavigationTitleType = 0,  //标题类型
    
    NavigationIconype = 1, //图标类型
    
    NavigationIconAndTitle = 2, //图标和标题类型
    
};


typedef NS_ENUM(NSInteger,BaseNavigationItemType)
{
    LeftBaseNavigationItemType=1,//!< 左按钮
    
    RightBaseNavigationItemType=2,//!< 右按钮

};

-(void)setTextColor:(UIColor*)color;
-(void)setImageName:(NSString *)name;
-(void)setText:(NSString *)text;

-(void)resetFrame:(CGRect)frame;



#pragma mark 设置按钮的样式
-(void)setItemContentType:(BaseNavigationItemContentType)contentType withItemType:(BaseNavigationItemType)itemType withIconName:(NSString*)iconName withTitle:(NSString*)title;
@end
