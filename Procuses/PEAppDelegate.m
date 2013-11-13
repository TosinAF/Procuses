//
//  PEAppDelegate.m
//  Procuses
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <Parse/Parse.h>
#import "PEAppDelegate.h"
#import "PEExcuseViewController.h"

#define ParseAppID @"xed9cfbQReafyFZb37jyUyuZNZ4scm5OxgH135zZ"
#define ParseClientKey @"a4OQfAJ6L8CKfVV5yc9jB7VrxspzG9yjAFfXXhwY"

@implementation PEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:ParseAppID clientKey:ParseClientKey];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    PEExcuseViewController *viewController = [[PEExcuseViewController alloc] init];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];

    return YES;
}


@end
