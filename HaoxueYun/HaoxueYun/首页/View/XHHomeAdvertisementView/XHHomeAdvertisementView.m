//
//  XHHomeAdvertisementView.m
//  HaoxueYun
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 Yaolizhi. All rights reserved.
//

#import "XHHomeAdvertisementView.h"
#import "XHHomeFrame.h"


@interface XHHomeAdvertisementView () <TYCyclePagerViewDelegate,TYCyclePagerViewDataSource>

@property (nonatomic,strong) TYCyclePagerView *pagerView; //!< 分页视图



@end


@implementation XHHomeAdvertisementView


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setBackgroundColor:[UIColor orangeColor]];
        [self addSubview:self.pagerView];
        [self setItemColor:NO];
    }
    return self;
}

- (void)setItemFrame:(XHHomeFrame*)frame
{
    [self setFrame:frame.itemFrame];
    [self.pagerView setFrame:CGRectMake(0, 0.0, frame.itemFrame.size.width, frame.itemFrame.size.height)];
    [self.dataArray setArray:frame.model.itemArray];
    [self.pagerView.layout setItemSize:CGSizeMake(CGRectGetWidth(self.pagerView.frame)*0.8, CGRectGetHeight(self.pagerView.frame)*0.9)];
    [self.pagerView reloadData];
}


#pragma mark - Delegate Method
#pragma mark TYCyclePagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView
{
    return [self.dataArray count];
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index
{
    TYCyclePagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndex:index];
    [cell setitemModel:[self.dataArray objectsAtIndex:index]];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView
{
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(SCREEN_WIDTH*0.8, SCREEN_WIDTH*0.9);
    layout.itemSpacing = 10.0;
    //layout.minimumAlpha = 0.3;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    NSLog(@"%zd ->  %zd",fromIndex,toIndex);
}


#pragma mark TYCyclePagerViewDelegate
- (void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index
{
    XHHomeItemFrame *objectItemFrame = [self.dataArray objectAtIndex:index];

}











#pragma mark - Getter /  Setter
-(TYCyclePagerView *)pagerView
{
    if (!_pagerView)
    {
        _pagerView = [[TYCyclePagerView alloc]init];
        [_pagerView registerClass:[TYCyclePagerViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        
        [_pagerView setDelegate:self];
        [_pagerView setDataSource:self];
        [_pagerView setIsInfiniteLoop:YES];
        [_pagerView setAutoScrollInterval:0];
        [_pagerView.layout setItemSpacing:10.0];
        [_pagerView.layout setLayoutType:TYCyclePagerTransformLayoutLinear];
    }
    return _pagerView;
}





- (void)setItemColor:(BOOL)color
{
    if (color)
    {
    }
}



//ico_chuchuang2
//ico_chuchuang1
//ico_online







@end
