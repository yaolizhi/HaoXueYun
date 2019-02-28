//
//  NSObject+Category.h
//  daycareParent
//
//  Created by Git on 2017/11/27.
//  Copyright © 2017年 XueHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSObject (Category)


+(BOOL)isArray:(id)object;


+(BOOL)isDictionary:(id)object;


#pragma mark 验证密码是否符合格式
/**
 @param pass 密码字符串
 @return BOOL 返回布尔值，是否符合格式
 */
+(BOOL)verifyPassword:(NSString *)pass;


#pragma mark 验证手机号是否符合格式
+(BOOL)verifyPhone:(NSString*)phone;


#pragma mark --- 验证电话号码是否符合规则
/**
 验证电话号码是否符合规则
 */
+(BOOL)verifyPhoneNumberMatch:(id)phoneNumber;

#pragma mark --- 验证是否是数字符合规则
/**
 验证码是否符合规则
 */
+(BOOL)verifyNumberMatch:(id)phoneNumber;



#pragma mark  验证码是否符合规则
/**
 @param codeNumber 验证码字符串
 @return BOOL 返回布尔值 是否符合格式
 */
+(BOOL)verifyCodeMatch:(id)codeNumber;


#pragma mark 验证是否是数字和字母符合规则
/**
 验证是否是数字和字母符合规则
 */
+(BOOL)verifyIDentityMatch:(id)phoneNumber;


#pragma mark --- 验证密码是否符合规则
/**
 验证密码是否符合规则
 */
+(BOOL)verifyPasswordMatch:(id)password;

/*
 *  判断用户输入的密码是否符合规范，符合规范的密码要求：密码中必须同时包含数字和字母
 */
+(BOOL)verifyPassWordLegal:(NSString *)pass;

+ (BOOL)empty:(NSObject *)o;


#pragma mark 计算文本的宽度和高度
-(CGSize)contentSizeWithTitle:(NSString*)content withFontOfSize:(UIFont*)font withWidth:(CGFloat)maxWidth;
#pragma mark 计算文本的宽度
- (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
#pragma mark 计算文本的高度
- (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font;
#pragma mark 计算文本的宽度和高度
+(CGSize)contentSizeWithTitle:(NSString*)content withFontOfSize:(UIFont*)font withWidth:(CGFloat)maxWidth;
#pragma mark--给UILabel设置行间距和字间距
-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font withlineSpacing:(CGFloat)lineSpacing withAttributeNameFont:(NSNumber *)attributeNameFont;
#pragma mark--计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withlineSpacing:(CGFloat)lineSpacing withAttributeNameFont:(NSNumber *)attributeNameFont;

#pragma mark--计算UILabel的高度(带有行间距的情况)
+(CGSize)contentSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withlineSpacing:(CGFloat)lineSpacing withAttributeNameFont:(NSNumber *)attributeNameFont;
#pragma mark- 返回格式字符串
+(NSAttributedString*)contentAttributedString:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withlineSpacing:(CGFloat)lineSpacing withAttributeNameFont:(NSNumber *)attributeNameFont;

#pragma mark- 判断是否为整数
-(BOOL)isPureInt:(NSString *)string;
#pragma mark- 判断是否为纯数字
- (BOOL)validateNumber:(NSString*)number;
#pragma mark- 判断推送是否打开
-(BOOL)noticeJupsh;
#pragma mark- 修改label某几个字体颜色
-(void)chageLabelFont:(UIFont *)font makeRange:(NSRange)range label:(UILabel *)label;
#pragma mark- 修改label某几个字体颜色
-(void)chageLabelTextColor:(UIColor *)TextColor makeRange:(NSRange)range label:(UILabel *)label;
#pragma mark- 修改label某几个字体大小和颜色
-(void)chageLabelTextColor:(UIColor *)TextColor font:(UIFont *)font makeRange:(NSRange)range label:(UILabel *)label;
#pragma mark- 改变纯数字颜色和大小
-(void)chageLabelFigure:(UILabel *)label color:(UIColor *)color font:(UIFont *)font;
@end
