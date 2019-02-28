//
//  NSUserDefaults+UserInfo.h
//  ZhongBangShop
//
//  Created by Git on 2017/10/31.
//  Copyright © 2017年 Object. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (UserInfo)

#pragma mark 获取对应key值的内容
+(NSString*)objectItemForKey:(id)object;


#pragma mark 设置内容
+(void)setItemObject:(id)object forKey:(NSString*)forkey;

+(id)objectItemObjectForKey:(id)object;


#pragma 移除内容
+(void)removeObjectItemForKey:(NSString*)key;

@end
