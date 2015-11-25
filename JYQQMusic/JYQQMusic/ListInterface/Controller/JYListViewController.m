//
//  JYListViewController.m
//  JYQQMusic
//
//  Created by joyann on 15/11/24.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYListViewController.h"
#import "JYListTableViewDataSource.h"
#import "JYPlayViewController.h"

@interface JYListViewController () <UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) JYListTableViewDataSource *listDataSource;

@end

@implementation JYListViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addTableView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tableView.alpha = 0.0;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self addAnimations];
}

#pragma mark - Lazy Loading

- (JYListTableViewDataSource *)listDataSource
{
    if (!_listDataSource) {
        _listDataSource = [[JYListTableViewDataSource alloc] init];
    }
    return _listDataSource;
}

#pragma mark - Private Methods

- (void)addTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self.listDataSource;
    tableView.rowHeight = self.listDataSource.rowHeight;
    tableView.backgroundView = self.listDataSource.backgroundImageView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (void)addAnimations
{
    NSArray *cells = [self.tableView visibleCells];
    CGFloat width = self.tableView.bounds.size.width;
    [cells enumerateObjectsUsingBlock:^(UITableViewCell * _Nonnull cell, NSUInteger idx, BOOL * _Nonnull stop) {
        cell.transform = CGAffineTransformMakeTranslation(width, 0);
    }];
    
    self.tableView.alpha = 1.0;
    
    CGFloat offset = 0.1;
    [cells enumerateObjectsUsingBlock:^(UITableViewCell * _Nonnull cell, NSUInteger idx, BOOL * _Nonnull stop) {
        [UIView animateWithDuration:1.5 delay:offset * idx usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JYPlayViewController *playVC = [[JYPlayViewController alloc] init];
    
    playVC.song = self.listDataSource.songs[indexPath.row];

    playVC.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:playVC animated:YES];
    
}


@end
