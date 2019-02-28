//
//  ToadyExtensionOpenUrlHelper.h
//  HaoxueYun
//
//  Created by mac on 2018/9/7.
//  Copyright © 2018年 Yaolizhi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ToadyExtensionOpenUrlHelper : NSObject


@property (nonatomic,assign) BOOL isOpen;

/**
 单例初始化方法
 
 @return 单例初始化方法
 */
+ (instancetype)sharedHelper;


/**
 承接跳转url地址

 @param url 跳转url
 @return 如果是widget的跳转url地址返回YES，否则返回NO
 */
-(BOOL)handleOpenURL:(NSURL *)url;


#pragma mark 开始跳转
/**
 开始跳转
 */
-(void)setStartOpenOption;


@end
