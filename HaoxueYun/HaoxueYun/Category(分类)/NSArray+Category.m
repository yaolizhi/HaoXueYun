//
//  NSArray+Category.m
//  daycareParent
//
//  Created by Git on 2018/2/2.
//  Copyright © 2018年 XueHui. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)



+(void)enumerateObjectsWithArray:(id)array usingBlock:(enumerateBlock)block
{
    if ([array isKindOfClass:[NSArray class]])
    {
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
         {
             block(obj,idx,stop);
         }];
    }
}

+(void)enumerateObjectsWithArray:(id)array usingforceBlock:(forceEnumerateBlock)block
{
    if ([array isKindOfClass:[NSArray class]] && [array count])
    {
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
         {
             block(obj,idx,stop,YES);
         }];
    }
    else
    {
        
        block(nil,0,nil,NO);
    }
}

+(void)enumerateObjectsWithArray:(id)array withOptions:(NSEnumerationOptions)options usingBlock:(enumerateBlock)block
{
    if ([array isKindOfClass:[NSArray class]])
    {
        [array enumerateObjectsWithOptions:options usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             block(obj,idx,stop);
         }];
    }
}


-(id)objectsAtIndex:(NSUInteger)index
{
    if ([self count])
    {
        return [self objectAtIndex:index];
    }
    else
    {
        return nil;
    }
    
}

@end
