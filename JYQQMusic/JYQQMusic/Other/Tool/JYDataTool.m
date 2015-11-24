//
//  JYDataTool.m
//  JYQQMusic
//
//  Created by joyann on 15/11/24.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYDataTool.h"
#import "JYSong.h"
#import "MJExtension.h"

static NSString * const kFileName = @"Musics.plist";

static JYDataTool *tool = nil;

@implementation JYDataTool

#pragma mark - Shared Intanse

+ (instancetype)sharedTool
{
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [super allocWithZone: zone];
    });
    return tool;
}

#pragma mark - Load Data

- (void)loadDataWithcompletionHandler: (void (^)(NSArray *songs))completionBlock;
{
    NSArray *results = [JYSong mj_objectArrayWithFilename:kFileName];
    completionBlock(results);
}

@end
