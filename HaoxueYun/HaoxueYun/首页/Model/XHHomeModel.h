//
//  XHHomeModel.h
//  HaoxueYun
//
//  Created by mac on 2019/2/27.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHHomeItemFrame.h"


typedef NS_ENUM(NSInteger,XHHomeModelType )
{
    XHHomeHeaderType = 0,   //!< 头部视图
    XHHomeInterestType = 1, //!< 猜你所需
    XHHomeIntroducetType = 2, //!< 为你推荐
};


NS_ASSUME_NONNULL_BEGIN

@interface XHHomeModel : NSObject

@property (nonatomic,strong) NSMutableArray *itemArray; //!< 内容数组

@property (nonatomic,assign) XHHomeModelType type; //!< 类型




@end

NS_ASSUME_NONNULL_END
