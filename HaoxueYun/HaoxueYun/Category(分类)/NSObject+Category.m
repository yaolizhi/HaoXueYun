//
//  NSObject+Category.m
//  daycareParent
//
//  Created by Git on 2017/11/27.
//  Copyright © 2017年 XueHui. All rights reserved.
//

#import "NSObject+Category.h"
#import "NSString+Category.h"

@implementation NSObject (Category)

+(BOOL)isArray:(id)object
{
    if ([object isKindOfClass:[NSArray class]])
    {
        if ([object count])
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else
    {
        return NO;
    }
}

+(BOOL)isDictionary:(id)object
{
    if ([object isKindOfClass:[NSDictionary class]])
    {
        if ([object count])
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else if ([object isKindOfClass:[NSMutableDictionary class]])
    {
        if ([object count])
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else
    {
        return NO;
    }
}



// 判断密码
+(BOOL)verifyPassword:(NSString *)pass
{
    // 判断长度大于6位后再接着判断是否同时包含数字和字符
    NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:pass];
}


//判断手机号
+(BOOL)verifyPhone:(NSString*)phone
{
    NSString *phoneRegex = @"^((13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}



#pragma mark --- 验证是否是数字符合规则
/**
 验证码是否符合规则
 */
+(BOOL)verifyNumberMatch:(id)phoneNumber
{
    //11位点化号码
    NSString *regex = @"^[0-9]{1,100}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regex];
    BOOL isMatch = [pred evaluateWithObject:phoneNumber];
    
    return isMatch;
}



#pragma mark --- 验证是否是数字和字母符合规则
/**
 验证是否是数字和字母符合规则
 */
+(BOOL)verifyIDentityMatch:(id)phoneNumber
{
    //验证身份证，数字或者数字+字母
    NSString *regex = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regex];
    BOOL isMatch = [pred evaluateWithObject:phoneNumber];
    
    return isMatch;
}
/*
 *  判断用户输入的密码是否符合规范，符合规范的密码要求：密码中必须同时包含数字和字母
 */
+(BOOL)verifyPassWordLegal:(NSString *)pass
{
    BOOL result = false;
    NSString *regex = @"\\d{0,}([a-z]{1,}\\d{1,}){1,}[a-z]{0,}";
    regex = @"((?=.*\\d)(?=.*[a-zA-Z]))[\\da-zA-Z]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    result = [predicate evaluateWithObject:pass];
    
    return result;
    
}

#pragma mark --- 验证码是否符合规则
/**
 验证码是否符合规则
 */
+(BOOL)verifyCodeMatch:(id)phoneNumber
{
    //11位点化号码
    NSString *regex = @"^[0-9]{4,6}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regex];
    BOOL isMatch = [pred evaluateWithObject:phoneNumber];
    
    return isMatch;
}



#pragma mark --- 验证电话号码是否符合规则
/**
 验证电话号码是否符合规则
 */
+(BOOL)verifyPhoneNumberMatch:(id)phoneNumber
{
    //11位点化号码
    NSString *regex = @"^[0-9]{11}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regex];
    BOOL isMatch = [pred evaluateWithObject:phoneNumber];
    
    return isMatch;
}



#pragma mark --- 验证密码是否符合规则
/**
 验证密码是否符合规则
 */
+(BOOL)verifyPasswordMatch:(id)password
{
    //11位点化号码
    NSString *regex = @"[a-zA-Z0-9_]{6,30}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regex];
    BOOL isMatch = [pred evaluateWithObject:password];
    
    return isMatch;
}



+ (BOOL)empty:(NSObject *)o
{
    if (o==nil)
    {
        return YES;
    }
    if (o==NULL)
    {
        return YES;
    }
    if (o==[NSNull new])
    {
        return YES;
    }
    
    if ([o isKindOfClass:[NSString class]])
    {
        return [NSString isBlankString:(NSString *)o];
    }
    
    if ([o isKindOfClass:[NSData class]])
    {
        return [((NSData *)o) length]<=0;
    }
    
    if ([o isKindOfClass:[NSDictionary class]])
    {
        return [((NSDictionary *)o) count] <= 0;
    }
    
    if ([o isKindOfClass:[NSArray class]])
    {
        return [((NSArray *)o) count] <= 0;
    }
    
    if ([o isKindOfClass:[NSSet class]])
    {
        return [((NSSet *)o) count]<=0;
    }
    return NO;
}



#pragma mark 计算文本的宽度和高度
-(CGSize)contentSizeWithTitle:(NSString*)content withFontOfSize:(UIFont*)font withWidth:(CGFloat)maxWidth
{
    //=========得到content的内容高度===========
    NSDictionary *AttriButes = @{NSFontAttributeName: font};
    CGSize ContentSize = [content boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:AttriButes
                                               context:nil].size;
    //译文本高度
    return ContentSize;
}
#pragma mark 计算文本的宽度
- (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}
#pragma mark 计算文本的高度
- (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}
#pragma mark 计算文本的宽度和高度
+(CGSize)contentSizeWithTitle:(NSString*)content withFontOfSize:(UIFont*)font withWidth:(CGFloat)maxWidth
{
    //=========得到content的内容高度===========
    NSDictionary *AttriButes = @{NSFontAttributeName: font};
    CGSize ContentSize = [content boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:AttriButes
                                               context:nil].size;
    //译文本高度
    return ContentSize;
}
#pragma mark- 修改label某几个字体大小
-(void)chageLabelFont:(UIFont *)font makeRange:(NSRange)range label:(UILabel *)label
{
    NSMutableAttributedString *str  = [[NSMutableAttributedString alloc] initWithString:label.text];
    
    [str addAttribute:NSFontAttributeName value:font range:range];
    label.attributedText = str;
}
#pragma mark- 修改label某几个字体颜色
-(void)chageLabelTextColor:(UIColor *)TextColor makeRange:(NSRange)range label:(UILabel *)label
{
    NSMutableAttributedString *str  = [[NSMutableAttributedString alloc] initWithString:label.text];
    
    [str addAttribute:NSForegroundColorAttributeName value:TextColor range:range];
    
    label.attributedText = str;
    
}
#pragma mark- 修改label某几个字体大小和颜色
-(void)chageLabelTextColor:(UIColor *)TextColor font:(UIFont *)font makeRange:(NSRange)range label:(UILabel *)label
{
    NSMutableAttributedString *str  = [[NSMutableAttributedString alloc] initWithString:label.text];
    
    [str addAttribute:NSForegroundColorAttributeName value:TextColor range:range];
    
    [str addAttribute:NSFontAttributeName value:font range:range];
    
    label.attributedText = str;
    
}
#pragma mark- 改变纯数字颜色和大小
-(void)chageLabelFigure:(UILabel *)label color:(UIColor *)color font:(UIFont *)font
{
    NSArray *number = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:label.text];
    for (int i = 0; i < label.text.length; i ++)
    {
        //这里的小技巧，每次只截取一个字符的范围
        NSString *a = [label.text substringWithRange:NSMakeRange(i, 1)];
        //判断装有0-9的字符串的数字数组是否包含截取字符串出来的单个字符，从而筛选出符合要求的数字字符的范围NSMakeRange
        //NSUnderlineStyleSingle 带下划线
        if ([number containsObject:a])
        {
            [attributeString setAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font,NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleNone]} range:NSMakeRange(i, 1)];
        }
        
    }
    //完成查找数字，最后将带有字体下划线的字符串显示在UILabel上
    label.attributedText = attributeString;
}
#pragma mark--给UILabel设置行间距和字间距
-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font withlineSpacing:(CGFloat)lineSpacing withAttributeNameFont:(NSNumber *)attributeNameFont
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpacing; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:attributeNameFont
                          };
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}
#pragma mark--计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withlineSpacing:(CGFloat)lineSpacing withAttributeNameFont:(NSNumber *)attributeNameFont
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpacing;//行高
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:attributeNameFont//字体间距
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine |  NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.height;
}







#pragma mark--计算UILabel的高度(带有行间距的情况)
+(CGSize)contentSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withlineSpacing:(CGFloat)lineSpacing withAttributeNameFont:(NSNumber *)attributeNameFont
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpacing;//行高
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:attributeNameFont//字体间距
                          };
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine |  NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size;
}


#pragma mark- 返回格式字符串
+(NSAttributedString*)contentAttributedString:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withlineSpacing:(CGFloat)lineSpacing withAttributeNameFont:(NSNumber *)attributeNameFont
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    [paraStyle setLineSpacing:lineSpacing];//行高
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:attributeNameFont/*字体间距*/};
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];

    return attStr;
}



#pragma mark- 判断是否为整数
-(BOOL)isPureInt:(NSString *)string
{
    NSScanner *scan=[NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val]&&[scan isAtEnd];
}
#pragma mark- 判断是否为纯数字
- (BOOL)validateNumber:(NSString*)number
{
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    int i = 0;
    while (i < number.length)
    {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0)
        {
            res = NO;
            break;
        }
        i++;
    }
    return res;
    
}

-(BOOL)noticeJupsh
{
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0f) {
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone == setting.types) {
            NSLog(@"推送关闭");
            return NO;
        }else{
            NSLog(@"推送打开");
            return YES;
        }
    }else
    {
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if(UIRemoteNotificationTypeNone == type)
        {
            NSLog(@"推送关闭");
            return NO;
        }else{
            NSLog(@"推送打开");
            return YES;
        }
    }
}
@end
