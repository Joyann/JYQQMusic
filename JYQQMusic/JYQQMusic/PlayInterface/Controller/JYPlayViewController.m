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
#import "JYPlayOperationView.h"
#import "Masonry.h"

@interface JYPlayViewController ()
@property (nonatomic, weak) UIImageView *backgroundImageView;
@property (nonatomic, weak) UIToolbar *toolBar;
@property (nonatomic, weak) JYPlayHeaderView *headerView;
@property (nonatomic, weak) JYPlayOperationView *operationView;
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
    
    // 头部视图
    JYPlayHeaderView *headerView = [JYPlayHeaderView headerViewWithTitle:self.song.name subTitle:self.song.singer];
    self.headerView = headerView;
    [self.view addSubview:headerView];
    
    // 操作视图
    JYPlayOperationView *operationView = [[JYPlayOperationView alloc] init];
    self.operationView = operationView;
    [self.view addSubview:operationView];
}

- (void)addConstraints
{
    // 添加头部视图的约束.
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading);
        make.top.equalTo(self.view.mas_top).offset(40);
        make.trailing.equalTo(self.view.mas_trailing);
        make.height.equalTo(@(100));
    }];
    
    // 添加操作视图的约束.
    [self.operationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.height.equalTo(@(150));
    }];
}

- (void)commonInit
{
    
}


@end
