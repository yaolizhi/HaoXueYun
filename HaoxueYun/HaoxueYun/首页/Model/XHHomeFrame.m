//
//  XHHomeFrame.m
//  HaoxueYun
//
//  Created by mac on 2019/2/27.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import "XHHomeFrame.h"

@implementation XHHomeFrame


-(void)setModel:(XHHomeModel *)model
{
    _model = model;
    switch (model.type)
    {
        case XHHomeHeaderType:
        {
            [self setItemSize:CGSizeMake(SCREEN_WIDTH, 620.0)];
        }
            break;
        case XHHomeInterestType:
        {
             [self setItemSize:CGSizeMake(SCREEN_WIDTH, 50.0)];
        }
            break;
        case XHHomeIntroducetType:
        {
             [self setItemSize:CGSizeMake(SCREEN_WIDTH, 50.0)];
        }
            break;
    }
}

@end
