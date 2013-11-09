//
//  PEMenuViewController.h
//  Procuses
//
//  Created by Tosin Afolabi on 09/11/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PEMenuViewControllerDelegate;

@interface PEMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<PEMenuViewControllerDelegate> delegate;

@end

@protocol PEMenuViewControllerDelegate <NSObject>

@required

- (void)menuViewController:(PEMenuViewController *)viewController didChooseExcuseType:(int)excuseType;

@end
