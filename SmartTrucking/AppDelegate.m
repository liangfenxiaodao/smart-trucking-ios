//
//  AppDelegate.m
//  SmartTrucking
//
//  Created by Jacky Li on 22/5/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "AppDelegate.h"
#import "SearchViewController.h"
#import "MyAccountViewController.h"
#import "MoreInformationViewController.h"
#import "ListingsMapViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  UINavigationController *listingsMapViewController = [[UINavigationController alloc] initWithRootViewController:[[ListingsMapViewController alloc] init]];
//  UITabBarController *tabBarController = [[UITabBarController alloc] init];
//  [tabBarController setViewControllers:@[
//          listingsMapViewController,
//          [[SearchViewController alloc] init],
//          [[MyAccountViewController alloc] init],
//          [[UINavigationController alloc] initWithRootViewController:[[MoreInformationViewController alloc] init]]
//  ]];
  self.window.rootViewController = listingsMapViewController;
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

@end