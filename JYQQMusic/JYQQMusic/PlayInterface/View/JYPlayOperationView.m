//
//  JYPlayOperationView.m
//  JYQQMusic
//
//  Created by joyann on 15/11/25.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYPlayOperationView.h"
#import "Masonry.h"

@interface JYPlayOperationView ()
@property (nonatomic, weak) UISlider *progressView;
@property (nonatomic, weak) UIButton *backButton;
@property (nonatomic, weak) UIButton *nextButton;
@property (nonatomic, weak) UIButton *playButton;
@property (nonatomic, weak) UILabel *costTimeLabel;
@property (nonatomic, weak) UILabel *totalTimeLabel;
@end

@implementation JYPlayOperationView

#pragma mark - Life Cycle

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
    UISlider *progressView = [[UISlider alloc] init];
    [progressView setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:UIControlStateNormal];
    [progressView setTintColor:[UIColor greenColor]];
    self.progressView = progressView;
    [self addSubview:progressView];
    
    UILabel *costTimeLabel = [[UILabel alloc] init];
    costTimeLabel.font = [UIFont systemFontOfSize:14.0];
    costTimeLabel.textColor = [UIColor whiteColor];
    costTimeLabel.text = @"00:00";
    self.costTimeLabel = costTimeLabel;
    [self addSubview:costTimeLabel];
    
    UILabel *totalTimeLabel = [[UILabel alloc] init];
    totalTimeLabel.font = [UIFont systemFontOfSize:14.0];
    totalTimeLabel.textColor = [UIColor whiteColor];
    totalTimeLabel.text = @"00:00";
    self.totalTimeLabel = totalTimeLabel;
    [self addSubview:totalTimeLabel];
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playButton setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
    [playButton setImage:[UIImage imageNamed:@"player_btn_pause_highlight"] forState:UIControlStateHighlighted];
    self.playButton = playButton;
    [self addSubview:playButton];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"player_btn_pre_normal"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"player_btn_pre_highlight"] forState:UIControlStateHighlighted];
    self.backButton = backButton;
    [self addSubview:backButton];
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton setImage:[UIImage imageNamed:@"player_btn_next_normal"] forState:UIControlStateNormal];
    [nextButton setImage:[UIImage imageNamed:@"player_btn_next_highlight"] forState:UIControlStateHighlighted];
    self.nextButton = nextButton;
    [self addSubview:nextButton];
}

- (void)addConstraints
{
    [self.costTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(8);
        make.top.equalTo(self.mas_top).offset(8);
    }];
    
    [self.totalTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.mas_trailing).offset(-8);
        make.top.equalTo(self.costTimeLabel.mas_top);
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.costTimeLabel.mas_trailing).offset(8);
        make.trailing.equalTo(self.totalTimeLabel.mas_leading).offset(-8);
        make.centerY.equalTo(self.costTimeLabel.mas_centerY);
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.progressView.mas_leading);
        make.top.equalTo(self.progressView.mas_bottom).offset(40);
    }];
    
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.backButton.mas_top);
    }];
    
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.progressView.mas_trailing);
        make.top.equalTo(self.backButton.mas_top);
    }];
}

@end
