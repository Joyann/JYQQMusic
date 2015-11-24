//
//  JYListTableViewDataSource.m
//  JYQQMusic
//
//  Created by joyann on 15/11/24.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYListTableViewDataSource.h"
#import "JYDataTool.h"
#import "JYListTableViewCell.h"

@interface JYListTableViewDataSource ()
@property (nonatomic, strong) NSArray *songs;
@end

@implementation JYListTableViewDataSource

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[JYDataTool sharedTool] loadDataWithcompletionHandler:^(NSArray *songs) {
            self.songs = songs;
        }];
        self.rowHeight = 100.0;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYListTableViewCell *cell = [JYListTableViewCell cellWithTableView: tableView];
    cell.song = self.songs[indexPath.row];
    return cell;
}

@end
