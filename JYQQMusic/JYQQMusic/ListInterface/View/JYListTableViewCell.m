//
//  JYListTableViewCell.m
//  JYQQMusic
//
//  Created by joyann on 15/11/24.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYListTableViewCell.h"
#import "Masonry.h"
#import "JYSong.h"

static NSString * const cellIdentifier = @"cellIdentifier";

@interface JYListTableViewCell ()
@property (nonatomic, weak) UIImageView *songImageView;
@property (nonatomic, weak) UILabel *songTitleLabel;
@property (nonatomic, weak) UILabel *songDetailLabel;
@end

@implementation JYListTableViewCell

#pragma mark - Life Cycle

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    JYListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[JYListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        [self addConstraints];
    }
    return self;
}

#pragma mark - Private Methods

- (void)setSong:(JYSong *)song
{
    _song = song;
    
    self.songImageView.image = [UIImage imageNamed:song.icon];
    self.songTitleLabel.text = song.name;
    self.songDetailLabel.text = song.singer;
}

- (void)addSubviews
{
    UIImageView *imageView = [[UIImageView alloc] init];
    self.songImageView = imageView;
    self.songImageView.layer.cornerRadius = 40;
    self.songImageView.layer.masksToBounds = YES;
    [self addSubview:imageView];
    
    UILabel *songTitleLabel = [[UILabel alloc] init];
    songTitleLabel.textColor = [UIColor whiteColor];
    self.songTitleLabel = songTitleLabel;
    [self addSubview:songTitleLabel];
    
    UILabel *songDetailLabel = [[UILabel alloc] init];
    songDetailLabel.textColor = [UIColor whiteColor];
    self.songDetailLabel = songDetailLabel;
    [self addSubview:songDetailLabel];
}

- (void)addConstraints
{
    [self.songImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(20);
        make.top.equalTo(self.mas_top).offset(10);
        make.height.equalTo(@80);
        make.width.equalTo(@80);
    }];
    
    [self.songTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.songImageView.mas_trailing).offset(20);
        make.top.equalTo(self.songImageView.mas_top);
    }];
    
    [self.songDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.songTitleLabel.mas_leading);
        make.bottom.equalTo(self.songImageView.mas_bottom);
    }];
}

@end
