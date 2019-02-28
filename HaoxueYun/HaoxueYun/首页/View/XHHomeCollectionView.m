//
//  XHHomeCollectionView.m
//  HaoxueYun
//
//  Created by mac on 2019/2/27.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import "XHHomeCollectionView.h"




@implementation XHHomeCollectionView



-(instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self = [super initWithFrame:CGRectZero collectionViewLayout:layout];
    {
        [self registerClass:[XHHomeCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        [self registerClass:[XHHomeHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
        [self setBackgroundColor:RGB(244.0, 244.0, 244.0)];
        
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
    return [self.dataArray count];
}



#pragma mark 每个分区中的子个数
- (NSInteger)collectionView:(BaseCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    XHHomeFrame *frame = [self.dataArray objectAtIndex:section];
    return [frame.model.itemArray count];
}




#pragma mark 分区中cell的个数
- (XHHomeCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    XHHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    XHHomeFrame *frame = [self.dataArray objectAtIndex:indexPath.section];
    [cell setItemObject:[frame.model.itemArray objectAtIndex:indexPath.row]];
    return cell;
}


#pragma mark UICollectionViewDelegate
#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    XHHomeFrame *homeFrame = [self.dataArray objectAtIndex:indexPath.section];
    XHHomeItemFrame *itemFrame = [homeFrame.model.itemArray objectAtIndex:indexPath.row];
    return CGSizeMake(itemFrame.itemSize.width,itemFrame.itemSize.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
}


#pragma mark 头部视图大小
#pragma mark 分区头部大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    XHHomeFrame *homeFrame = [self.dataArray objectAtIndex:section];
    return homeFrame.itemSize;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (XHHomeHeaderReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        XHHomeHeaderReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        [header setHeaderItemFrame:[self.dataArray objectAtIndex:indexPath.section]];
        return header;
    }
    else
    {
        return nil;
    }
}





@end
