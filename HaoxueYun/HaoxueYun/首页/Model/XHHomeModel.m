//
//  XHHomeModel.m
//  HaoxueYun
//
//  Created by mac on 2019/2/27.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import "XHHomeModel.h"

@implementation XHHomeModel



#pragma mark - Getter /  Setter
-(NSMutableArray *)itemArray
{
    if (!_itemArray)
    {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}




@end
