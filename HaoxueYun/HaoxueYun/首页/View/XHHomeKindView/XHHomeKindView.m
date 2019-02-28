//
//  XHHomeKindView.m
//  HaoxueYun
//
//  Created by mac on 2019/2/28.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import "XHHomeKindView.h"

@implementation XHHomeKindView

-(instancetype)init
{
    self = [super initWithType:UICollectionViewScrollDirectionHorizontal];
    {
        [self registerClass:[XHHomeKindViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        [self setBackgroundColor:[UIColor yellowColor]];
        
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setDelegate:self];
        [self setDataSource:self];
    }
    return self;
}




#pragma mark - Delegate Method
-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
}


-(void)setItemArray:(NSMutableArray *)itemArray
{
    [self.dataArray setArray:itemArray];
    [self reloadData];
}






#pragma mark - Delegate Method
#pragma mark UICollectionViewDataSource
#pragma mark 分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 0;
}



#pragma mark 每个分区中的子个数
- (NSInteger)collectionView:(BaseCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataArray count];
}




#pragma mark 分区中cell的个数
- (XHHomeKindViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    XHHomeKindViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setItemObject:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}


#pragma mark UICollectionViewDelegate
#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    XHHomeItemFrame *itemFrame = [self.dataArray objectAtIndex:indexPath.row];
    return CGSizeMake(itemFrame.itemSize.width,itemFrame.itemSize.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}




-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}





@end
