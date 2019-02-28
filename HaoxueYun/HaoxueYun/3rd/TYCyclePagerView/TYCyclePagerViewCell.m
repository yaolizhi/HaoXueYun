//
//  TYCyclePagerViewCell.m
//  TYCyclePagerViewDemo
//
//  Created by tany on 2017/6/14.
//  Copyright © 2017年 tany. All rights reserved.
//

#import "TYCyclePagerViewCell.h"

@interface TYCyclePagerViewCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TYCyclePagerViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.imageView];
        [self.imageView setLayerCornerRadius:5.0];
        [self.contentView setLayerCornerRadius:5.0];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}


-(void)setitemModel:(XHHomeItemFrame*)model
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.model] placeholderImage:[UIImage imageNamed:@"ico_chuchuang2"]];
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.imageView setFrame:self.bounds];
    [self.imageView setLayerCornerRadius:5.0];
    [self.contentView setLayerCornerRadius:5.0];
}


#pragma mark - Getter /  Setter
-(UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc]init];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _imageView;
}

@end
