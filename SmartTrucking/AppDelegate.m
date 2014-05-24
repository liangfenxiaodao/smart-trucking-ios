//
//  AppDelegate.m
//  SmartTrucking
//
//  Created by Jacky Li on 22/5/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "AppDelegate.h"
#import "GoodsViewController.h"
#import "SearchViewController.h"
#import "PublishViewController.h"
#import "MyAccountViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  UITabBarController *tabBarController = [[UITabBarController alloc] init];
  [tabBarController setViewControllers:@[
          [[GoodsViewController alloc] init],
          [[SearchViewController alloc] init],
          [[PublishViewController alloc] init],
          [[MyAccountViewController alloc] init]]];
  self.window.rootViewController = tabBarController;
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

@end