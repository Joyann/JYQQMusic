//
//  JYPlayViewController.m
//  JYQQMusic
//
//  Created by joyann on 15/11/25.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYPlayViewController.h"
#import "JYSong.h"
#import "JYPlayHeaderView.h"
#import "Masonry.h"

@interface JYPlayViewController ()
@property (nonatomic, weak) UIImageView *backgroundImageView;
@property (nonatomic, weak) UIToolbar *toolBar;
@property (nonatomic, weak) JYPlayHeaderView *headerView;
@end

@implementation JYPlayViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubviews];
    [self addConstraints];
    
    [self commonInit];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.backgroundImageView.frame = self.view.bounds;
    self.toolBar.frame = self.view.bounds;
}

#pragma mark - Private Methods

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)addSubviews
{
    // 背景
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.image = [UIImage imageNamed:self.song.icon];
    self.backgroundImageView = backgroundImageView;
    [self.view addSubview:backgroundImageView];
    
    // 模糊背景
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleBlack;
    self.toolBar = toolBar;
    [self.backgroundImageView addSubview:toolBar];
    
    // 标题栏
    JYPlayHeaderView *headerView = [JYPlayHeaderView headerViewWithTitle:self.song.name subTitle:self.song.singer];
    self.headerView = headerView;
    [self.view addSubview:headerView];
}

- (void)addConstraints
{
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading);
        make.top.equalTo(self.view.mas_top).offset(40);
        make.trailing.equalTo(self.view.mas_trailing);
        make.height.equalTo(@(100));
    }];
}

- (void)commonInit
{
    
}


@end
