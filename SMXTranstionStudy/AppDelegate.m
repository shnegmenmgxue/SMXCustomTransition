//
//  AppDelegate.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/2.
//

#import "AppDelegate.h"

@interface AppDelegate ()

//@property (strong, nonatomic) UIWindow *window;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    
//    self.window.backgroundColor = [UIColor blueColor];
//    
//    self.window.rootViewController =  [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
//    
//    [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
