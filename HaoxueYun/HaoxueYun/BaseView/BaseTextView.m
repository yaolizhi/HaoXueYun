//
//  BaseTextView.m
//  liaotian
//
//  Created by XueHui on 17/9/13.
//  Copyright © 2017年 姚立志. All rights reserved.
//

#import "BaseTextView.h"


@interface BaseTextView () <UITextViewDelegate>

@property (nonatomic,strong) UILabel *placeholderLabel; //!< 占位字符

@property (nonatomic,assign) NSInteger limitNumer;



@end

@implementation BaseTextView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setDelegate:self];
        [self addSubview:self.placeholderLabel];
        [self setFont:self.placeholderLabel.font];
    }
    return self;
}


-(void)reset
{
    [self setText:@""];
    [self.placeholderLabel setText:_placeholder];
    [self.placeholderLabel setHidden:NO];
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    [self.placeholderLabel setText:placeholder];
    
}
-(void)resetplaceholderLabel:(NSString *)placeholder font:(UIFont *)font
{
    self.placeholderLabel.numberOfLines=0;
    
    [self.placeholderLabel setFont:font];
   
    [self.placeholderLabel setText:placeholder];
    
    [self.placeholderLabel setFrame:CGRectMake(5, 8, self.width-10.0, [self getHeightByWidth:self.width-8 title:placeholder font:font])];
}
-(void)setPlaceholderColor:(UIColor*)color //!< 占位字符的颜色
{
    [self.placeholderLabel setTextColor:color];
}


-(void)setPlaceholderFont:(UIFont*)font //!< 占位符的字体大小
{
    [self.placeholderLabel setFont:font];
}
/**
 设置limit限制字数
 
 @param limit 限制的字数
 */
-(void)setLimit:(NSInteger)limit
{
    [self setLimitNumer:limit];
}

-(void)resetText:(NSString*)text
{
    [self setText:text];
    [self.placeholderLabel setHidden:YES];
}

#pragma mark - Getter / Setter
-(UILabel *)placeholderLabel
{
    if (_placeholderLabel == nil)
    {
        _placeholderLabel = [[UILabel alloc]init];
        [_placeholderLabel setTextColor:RGB(220.0, 220.0, 220.0)];
        [_placeholderLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_placeholderLabel setHidden:NO];
    }
    return _placeholderLabel;
}


-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
    [self.placeholderLabel setFrame:CGRectMake(5, 10.0, frame.size.width-10.0, 15.0)];
}

#pragma mark - Deletage Method

#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""])
    {
        [self.placeholderLabel setHidden:NO];
    }
    else
    {
        [self.placeholderLabel setHidden:YES];
    }
    
    if ([self.textDeletage respondsToSelector:@selector(textViewDidChange:)])
    {
        [self.textDeletage textViewDidChange:textView];
    }
}
@end
