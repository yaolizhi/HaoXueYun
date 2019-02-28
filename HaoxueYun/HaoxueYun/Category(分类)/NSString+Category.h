//
//  NSString+Category.h
//  daycareParent
//
//  Created by Git on 2017/11/27.
//  Copyright © 2017年 XueHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CommonCrypto/CommonCrypto.h>
#include <CommonCrypto/CommonDigest.h>
#include <zlib.h>

@interface NSString (Category)

#pragma mark 字符串安全保护，防止字符串为 nil <null> 导致程序崩溃问题
/**
 @param title 传入的对象
 @return NSString 返回“ @"" ”的字符串
 */
+(NSString*)safeString:(NSString*)title;
/**
 @param  aKey  防止空子典调用崩溃
 @return 防止空子典调用崩溃
 */
+(id)objectItemKey:(id)aKey;
-(id)objectItemKey:(id)aKey;
#pragma mark 验证字符串是否为空
/**
 @param string 验证的字符串
 @return BOOL 返回布尔值真假
 */
+ (BOOL)isBlankString:(NSString *)string;

#pragma mark 字符串进行md5加密
/**
 @return NSString 加密后的字符串
 */
-(NSString *)md5;




/**
 获取字符串首字母(传入汉字字符串, 返回大写拼音首字母)

 @return 转换之后的大写首字母
 */
- (NSString *)getFirstLetterFromString;
/**
 设置时间格式转换
 
 @param dateStr 传入的时间格式
 @return 得到时间格式
 */
+(NSString *)dateStr:(NSString *)dateStr;
#pragma mark YYYY-MM-dd
/**
 设置时间格式转换 @"YYYY-MM-dd"
 
 @param dateStr 传入的时间格式
 @return 得到时间格式
 */
+(NSString *)yearAndMonthAndDaydateStr:(NSString *)dateStr;
+(NSString *)dateWithDateFormatter:(NSString *)dateFormatter Date:(NSDate *)date;
+(BOOL)times:(NSString *)times withMultiple:(NSString *)multiple;
#pragma mark- 去除小数点后末尾的零
+(NSString*)removeFloatAllZeroByString:(NSString *)testNumber;
#pragma mark- 电话号码加星显示
+(NSString *)telephoneEncrypt:(NSString *)phone;
#pragma mark - 传递进去字符串，然后返回键值对类型的字典
/**
 传递进去字符串，然后返回键值对类型的字典
 */
+(NSDictionary*)inputRequestDataObject:(NSString*)dataObject;
@end
