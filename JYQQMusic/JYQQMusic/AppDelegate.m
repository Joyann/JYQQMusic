//
//  AppDelegate.m
//  JYQQMusic
//
//  Created by joyann on 15/11/24.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "AppDelegate.h"
#import "JYListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    JYListViewController *listVC = [[JYListViewController alloc] init];
    listVC.view.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = listVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
