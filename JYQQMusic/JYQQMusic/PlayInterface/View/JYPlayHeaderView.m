//
//  JYPlayHeaderView.m
//  JYQQMusic
//
//  Created by joyann on 15/11/25.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYPlayHeaderView.h"
#import "Masonry.h"

@interface JYPlayHeaderView ()
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *subTitleLabel;
@property (nonatomic, weak) UIButton *moreButton;
@end

@implementation JYPlayHeaderView

#pragma mark - Life Cycle

+ (instancetype)headerViewWithTitle: (NSString *)title subTitle: (NSString *)subTitle
{
    JYPlayHeaderView *headerView = [[JYPlayHeaderView alloc] init];
    
    headerView.titleLabel.text = title;
    headerView.subTitleLabel.text = subTitle;
    
    return headerView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self addConstraints];
    }
    return self;
}

#pragma mark - Private Methods

- (void)addSubviews
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:20.0];
    titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    UILabel *subTitleLabel = [[UILabel alloc] init];
    subTitleLabel.font = [UIFont systemFontOfSize:14.0];
    subTitleLabel.textColor = [UIColor whiteColor];
    self.subTitleLabel = subTitleLabel;
    [self addSubview:subTitleLabel];
    
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreButton setImage:[UIImage imageNamed:@"main_tab_more"] forState:UIControlStateNormal];
    [moreButton setImage:[UIImage imageNamed:@"main_tab_more_h"] forState:UIControlStateHighlighted];
    self.moreButton = moreButton;
    [self addSubview:moreButton];
}

- (void)addConstraints
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_top).offset(8);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleLabel.mas_centerX);
        make.centerY.equalTo(self.titleLabel.mas_bottom).offset(16);
    }];
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_trailing).offset(-30);
        make.centerY.equalTo(self.titleLabel.mas_bottom);
    }];
}

@end
