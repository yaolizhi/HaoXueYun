//
//  XHHomePokerView.m
//  HaoxueYun
//
//  Created by mac on 2019/2/28.
//  Copyright © 2019年 Haoxue. All rights reserved.
//

#import "XHHomePokerView.h"


@interface XHHomePokerView () <SlideImageViewDelegate>

@property (nonatomic,strong) SlideImageView *slideImageView;


@end



@implementation XHHomePokerView


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.slideImageView = [[SlideImageView alloc]initWithFrame:CGRectMake(30.0, 20.0, (SCREEN_WIDTH-60.0), (500-40.0)) ZMarginValue:5 XMarginValue:10 AngleValue:0.0 Alpha:1000];
        [self.slideImageView setBorderColor:[UIColor whiteColor]];
        [self.slideImageView setDelegate:self];
        [self.slideImageView setImageShadowsWtihDirectionX:2 Y:2 Alpha:0.7];
        [self addSubview:self.slideImageView];
    }
    return self;
}



-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    
    
    for(int i=0; i<5; i++)
    {
        NSString* imageName = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage* image = [UIImage imageNamed:imageName];
        [self.slideImageView addImage:image];
    }
    
    [self.slideImageView reLoadUIview];
    
    
   
}



#pragma mark - Delegate Method
#pragma mark 对点击图片后的处理
- (void)SlideImageViewDidClickWithIndex:(int)index
{

}


#pragma mark 结束滚动后的处理
- (void)SlideImageViewDidEndScorllWithIndex:(int)index
{
    
}


@end
