//
//  PEAppDelegate.m
//  Procuses
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <Parse/Parse.h>
#import "FUIAlertView.h"
#import "PEAppDelegate.h"
#import "PERootViewController.h"

#define ParseAppID @"xed9cfbQReafyFZb37jyUyuZNZ4scm5OxgH135zZ"
#define ParseClientKey @"a4OQfAJ6L8CKfVV5yc9jB7VrxspzG9yjAFfXXhwY"

@implementation PEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[PERootViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    [Parse setApplicationId:ParseAppID clientKey:ParseClientKey];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [self getExcusesFromParse];

    return YES;
}

- (void)getExcusesFromParse
{
    PFQuery *query = [PFQuery queryWithClassName:@"Excuses"];
    query.cachePolicy = kPFCachePolicyNetworkElseCache;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {

            // Results were successfully found, looking first on the network and then on disk.
            if (objects != nil || [objects count] != 0)
                [[NSNotificationCenter defaultCenter] postNotificationName:@"ExcusesDownloaded" object:self];

            NSArray *excusesArray = objects;
            self.designerExcuses = [[NSMutableArray alloc] init];
            self.developerExcuses = [[NSMutableArray alloc] init];
            self.accountManagerExcuses = [[NSMutableArray alloc] init];

            for (PFObject *excuse in excusesArray) {
                if ([excuse[@"excuseType"] isEqualToString:@"Designer"]) {
                    [self.designerExcuses addObject:excuse];
                } else if ([excuse[@"excuseType"] isEqualToString:@"Developer"]) {
                    [self.developerExcuses addObject:excuse];
                } else if ([excuse[@"excuseType"] isEqualToString:@"AccountManager"]) {
                    [self.accountManagerExcuses addObject:excuse];
                }
            }

        } else {
            
            // The network was inaccessible and we have no cached data for this query.
            NSLog(@"Error: %@ %@", error, [error userInfo]);

        }
    }];
}



@end
