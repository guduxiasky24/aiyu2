//
//  AppDelegate.m
//  aiyu2
//
//  Created by 吴金林 on 15/6/9.
//  Copyright (c) 2015年 kolin. All rights reserved.
//

#import "AppDelegate.h"
#import "NewFeatureViewController.h"
#import "OAuthController.h"
#import "AccountModel.h"
#import "AccountTool.h"
#import "UIWindow+Extension.h"
#import "LoginViewController.h"
#import "IQKeyboardManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //键盘处理
    IQKeyboardManager *manager=[IQKeyboardManager sharedManager];
    manager.enable=YES;//控制整个功能是否启用。
    manager.shouldResignOnTouchOutside=YES;//控制点击背景是否收起键盘
    manager.shouldToolbarUsesTextFieldTintColor=YES;//控制键盘上的工具条文字颜色是否用户自定义。
    manager.enableAutoToolbar=NO;//控制是否显示键盘上的工具条。
    //1.创建窗口w;
    self.window=[[UIWindow alloc]init];
    self.window.frame=[UIScreen mainScreen].bounds;
    
    //2.设置根控制器
    
    //2. 设置根控制器
    NSString *key = @"CFBundleVersion";
    // 上一次的使用版本（存储在沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    // 当前软件的版本号（从Info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    if ([currentVersion isEqualToString:lastVersion]) { // 版本号相同：这次打开和上次打开的是同一个版本
        [self.window switchRootViewController];
    } else { // 这次打开的版本和上一次不一样，显示新特性
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:[NewFeatureViewController new]];
        self.window.rootViewController = nav;
        // 将当前的版本号存进沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    //3.显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the ap           aa                                                                                                                                                                                                       plication was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
