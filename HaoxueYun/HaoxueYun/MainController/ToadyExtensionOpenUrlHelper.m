//
//  ToadyExtensionOpenUrlHelper.m
//  HaoxueYun
//
//  Created by mac on 2018/9/7.
//  Copyright © 2018年 Yaolizhi. All rights reserved.
//

#import "ToadyExtensionOpenUrlHelper.h"
#import "MainRootControllerHelper.h"

@interface ToadyExtensionOpenUrlHelper ()

@property (nonatomic,copy) NSURL *openUrl;
@property (nonatomic,assign) BOOL isFirstStart;


@end


@implementation ToadyExtensionOpenUrlHelper

static ToadyExtensionOpenUrlHelper *helper = nil;

/**
 单例初始化方法
 
 @return 单例初始化方法
 */
+ (instancetype)sharedHelper
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        helper = [[self alloc]init];
        [helper setIsFirstStart:YES];
    });
    
    return helper;
}



-(BOOL)handleOpenURL:(NSURL *)url
{
    NSString *absolute = url.absoluteString;
    if ([absolute containsString:@"haoxueyunToadyExtension"])
    {
        [self setOpenUrl:url];
        [self setIsOpen:YES];
        [self setOpenOptionUrl:url];
        return YES;
    }
    else
    {
        return NO;
    }
}


-(void)setStartOpenOption
{
    if (helper.isOpen)
    {
        [self setOpenOptionUrl:self.openUrl];
        [helper setIsOpen:NO];
    }
}



-(void)setOpenOptionUrl:(NSURL *)openUrl
{
    
}





@end
