//
//  JYListTableViewDataSource.h
//  JYQQMusic
//
//  Created by joyann on 15/11/24.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JYListTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, assign) CGFloat rowHeight;
@property (nonatomic, strong) UIView *backgroundImageView;

@end
