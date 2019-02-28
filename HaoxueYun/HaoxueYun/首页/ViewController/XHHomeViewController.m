//
//  XHHomeViewController.m
//  HaoxueYun
//
//  Created by mac on 2019/2/27.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import "XHHomeViewController.h"
#import "XHHomeCollectionView.h"



@interface XHHomeViewController ()

@property (nonatomic,strong) XHHomeCollectionView *homeCollectionView;

@end

@implementation XHHomeViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
}



- (void)addSubViews:(BOOL)subview
{
    if (subview)
    {
        
        [self.view addSubview:self.homeCollectionView];
        [self.homeCollectionView resetFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        
        
        for (int i = 0; i< 3; i++)
        {
            XHHomeFrame *frame = [[XHHomeFrame alloc]init];
            XHHomeModel *model = [[XHHomeModel alloc]init];
            switch (i)
            {
                case 0:
                {
                    [model setType:XHHomeHeaderType];
                    [frame setModel:model];
                    [self.dataArray addObject:frame];
                }
                    break;
                case 1:
                {
                    [model setType:XHHomeInterestType];
                    
                    for (int i = 0; i <  10; i++)
                    {
                        XHHomeItemFrame *itemFrame = [[XHHomeItemFrame alloc]init];
                        XHHomeItemModel *itemModel = [[XHHomeItemModel alloc]init];
                        [itemFrame setModel:itemModel];
                        [model.itemArray addObject:itemFrame];
                    }
                    [frame setModel:model];
                    [self.dataArray addObject:frame];
                }
                    break;
                case 2:
                {
                    [model setType:XHHomeIntroducetType];
                    
                    for (int i = 0; i <  10; i++)
                    {
                        XHHomeItemFrame *itemFrame = [[XHHomeItemFrame alloc]init];
                        XHHomeItemModel *itemModel = [[XHHomeItemModel alloc]init];
                        [itemFrame setModel:itemModel];
                        [model.itemArray addObject:itemFrame];
                    }
                    [frame setModel:model];
                    [self.dataArray addObject:frame];
                }
                    break;
            }
            
        }
        
        
        [self.homeCollectionView setItemArray:self.dataArray];
    }
}




#pragma mark - Getter /  Setter
-(XHHomeCollectionView *)homeCollectionView
{
    if (!_homeCollectionView)
    {
        _homeCollectionView = [[XHHomeCollectionView alloc]init];
        [_homeCollectionView setBackgroundColor:[UIColor redColor]];
    }
    return _homeCollectionView;
}



@end
