//
//  AppDelegate.m
//  SmartTrucking
//
//  Created by Jacky Li on 22/5/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "AppDelegate.h"
#import "ListingsViewController.h"
#import "SearchViewController.h"
#import "MyAccountViewController.h"
#import "AddListingViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  UITabBarController *tabBarController = [[UITabBarController alloc] init];
  UINavigationController *listingsNavigationController = [[UINavigationController alloc] initWithRootViewController:[[ListingsViewController alloc] init]];
  UINavigationController *addListingNavigationController = [[UINavigationController alloc] initWithRootViewController:[[AddListingViewController alloc]init] ];
  [tabBarController setViewControllers:@[
          listingsNavigationController,
          [[SearchViewController alloc] init],
          addListingNavigationController,
          [[MyAccountViewController alloc] init]]];
  self.window.rootViewController = tabBarController;
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

@end