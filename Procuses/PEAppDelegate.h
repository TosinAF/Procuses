//
//  PEAppDelegate.h
//  Procuses
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PERootViewController;

@interface PEAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PERootViewController *viewController;

@property (nonatomic, retain) NSMutableArray *designerExcuses;
@property (nonatomic, retain) NSMutableArray *developerExcuses;
@property (nonatomic, retain) NSMutableArray *accountManagerExcuses;

@end
