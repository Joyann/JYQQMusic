//
//  JYPlayMiddleView.m
//  JYQQMusic
//
//  Created by joyann on 15/11/25.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYPlayMiddleView.h"
#import "Masonry.h"

@interface JYPlayMiddleView ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UILabel *lyricsLabel;

@end

@implementation JYPlayMiddleView

#pragma mark - Life Cycle

+ (instancetype)middleViewWithImage: (UIImage *)image
{
    JYPlayMiddleView *middleView = [[JYPlayMiddleView alloc] init];
    middleView.imageView.image = image;
    middleView.lyricsLabel.text = @"歌词";
    return middleView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self addConstraints];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width * 0.5;
    self.imageView.layer.masksToBounds = YES;
}

#pragma mark - Privates Methdos

- (void)addSubviews
{
    UIImageView *imageView = [[UIImageView alloc] init];
    self.imageView = imageView;
    self.imageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.imageView.layer.borderWidth = 5.0;
    [self addSubview: imageView];
    
    UILabel *lyricsLabel = [[UILabel alloc] init];
    lyricsLabel.textColor = [UIColor whiteColor];
    lyricsLabel.font = [UIFont systemFontOfSize:20.0];
    self.lyricsLabel = lyricsLabel;
    [self addSubview: lyricsLabel];
}

- (void)addConstraints
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-10);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width - 80));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.width - 80));
    }];
    
    [self.lyricsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.centerX.equalTo(self.imageView.mas_centerX);
    }];
}

@end
