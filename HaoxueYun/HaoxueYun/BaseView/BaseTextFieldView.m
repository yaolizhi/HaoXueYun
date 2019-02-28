//
//  BaseTextField.m
//  HaoxueYun
//
//  Created by mac on 2018/6/9.
//  Copyright © 2018年 Yaolizhi. All rights reserved.
//

#import "BaseTextFieldView.h"

@interface BaseTextFieldView () <UITextFieldDelegate>


@property (nonatomic,strong) UITextField *textField; //!< 文本输入框
@property (nonatomic,strong) UILabel *tipLabel; //!< 提示标签


@end

@implementation BaseTextFieldView



- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.tipLabel];
        [self addSubview:self.textField];
    }
    return self;
}


-(void)setTextFieldPlaceholder:(NSString *)placeholder
{
    [self.textField setPlaceholder:placeholder];
    [self.tipLabel setText:placeholder];
}



-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
//    self.textField setFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}


#pragma mark - Delegate Method
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    
    if (textField.text)
    {
        
    }
    else
    {
        
    }
    
    
    
    
    return YES;
}


#pragma mark - Getter /  Setter
-(UILabel *)tipLabel
{
    if (!_tipLabel)
    {
        _tipLabel = [[UILabel alloc]init];
        [_tipLabel setTextColor:RGB(102,102,102)];
        [_tipLabel setFont:[UIFont systemFontOfSize:14.0]];
    }
    return _tipLabel;
}


-(UITextField *)textField
{
    if (!_textField)
    {
        _textField = [[UITextField alloc]init];
        [_textField setDelegate:self];
        [_textField setTintColor:MainColor];
    }
    return _textField;
}


@end
