//
//  MJRefreshBackStateFooter.h
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/13.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "MJRefreshBackFooter.h"

@interface MJRefreshBackStateFooter : MJRefreshBackFooter

/** 所有状态对应的文字 */
@property (strong, nonatomic) NSMutableDictionary *stateTitles;

/** 显示刷新状态的label */
@property (weak, nonatomic, readonly) UILabel *stateLabel;
/** 设置state状态下的文字 */
- (void)setTitle:(NSString *)title forState:(MJRefreshState)state;
@end
