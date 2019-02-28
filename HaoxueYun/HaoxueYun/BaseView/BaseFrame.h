//
//  BaseFrame.h
//  HaoxueYun
//
//  Created by mac on 2019/2/27.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseFrame : NSObject

@property (nonatomic,assign) CGRect itemFrame;   //!< 单元格的Frame
@property (nonatomic,assign) CGSize itemSize;   //!< 单元格的size
@property (nonatomic,assign) CGSize contentSize;   //!< 单元格的size
@property (nonatomic,assign) CGFloat cellHeight; //!< 行高

@end



NS_ASSUME_NONNULL_END
