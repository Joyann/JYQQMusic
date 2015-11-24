//
//  JYDataTool.h
//  JYQQMusic
//
//  Created by joyann on 15/11/24.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYDataTool : NSObject

/**
 *  获取单例对象.
 *
 *  @return 返回一个JYDataTool的单例对象.
 */
+ (instancetype)sharedTool;

/**
 *  获取解析后的数组.里面保存的是JYSong对象.
 *
 *  @param completionBlock callback block.
 */
- (void)loadDataWithcompletionHandler: (void (^)(NSArray *songs))completionBlock;

@end
