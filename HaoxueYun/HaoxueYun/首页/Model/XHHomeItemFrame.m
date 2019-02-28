//
//  XHHomeItemFrame.m
//  HaoxueYun
//
//  Created by mac on 2019/2/27.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import "XHHomeItemFrame.h"

@implementation XHHomeItemFrame

-(void)setModel:(XHHomeItemModel *)model
{
    _model = model;
    [self setItemSize:CGSizeMake((SCREEN_WIDTH-30)/2.0,200.0)];
}

@end
