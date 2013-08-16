//
//  DEViewController.m
//  DesignerExcuses
//
//  Created by Tosin Afolabi on 03/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import "PEAppDelegate.h"
#import "PELikeButton.h"
#import "PEExcuseLabel.h"
#import "BaseExcuseViewController.h"
#import "UINavigationBar+FlatUI.h"

#define UIAppDelegate ((PEAppDelegate *)[UIApplication sharedApplication].delegate)

@interface BaseExcuseViewController ()

@property (nonatomic, copy) NSString *navBarTitle;
@property (nonatomic, copy) NSArray *excusesArray;
@property (nonatomic, strong) PELikeButton *likeButton;
@property (nonatomic, strong) PEExcuseLabel *excuseLabel;

@end

@implementation BaseExcuseViewController

@synthesize navBarTitle, excuseLabel, likeButton;

- (id)initWithType:(PEExcuseType)type
{
    self = [super init];

    if (self) {
        switch (type) {

            case PEExcuseTypeDesigner:
                self.navBarTitle = @"Designer";
                self.excusesArray = UIAppDelegate.designerExcuses;
                break;

            case PEExcuseTypeDeveloper:
                self.navBarTitle = @"Developer";
                self.excusesArray = UIAppDelegate.developerExcuses;
                break;

            case PEExcuseTypeAccountManger:
                self.navBarTitle = @"Account Manager";
                self.excusesArray = UIAppDelegate.accountManagerExcuses;
                break;
        }
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.navBarTitle;
    UIColor *backgroundColor = [UIColor colorWithRed:0.941 green:0.941 blue:0.918 alpha:1];
    self.view.backgroundColor = backgroundColor;

    // Modify the Navigation Bar

    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:backgroundColor];

    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeFont: [UIFont fontWithName:@"Didot" size:20],
                                                                    UITextAttributeTextColor: [UIColor blackColor]};

    UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [homeButton setFrame:CGRectMake(0, 0, 40, 40)];
    [homeButton setTitle:@"\u2302" forState:UIControlStateNormal];
    [homeButton.titleLabel setFont:[UIFont fontWithName:@"Entypo" size:30]];
    [homeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(homeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];

    // Excuse Label

    self.excuseLabel = [[PEExcuseLabel alloc] initWithFrame:CGRectMake(20.0, 130.0, 0.0, 0.0)];
    [self.excuseLabel setBackgroundColor:backgroundColor];
    [self.excuseLabel setFont:[UIFont fontWithName:@"Didot" size:40]];

    NSString *excuseString = self.excusesArray[arc4random_uniform([self.excusesArray count])][@"excuse"];
    [self.excuseLabel updateLabel:excuseString];

    // Like Button

    self.likeButton = [PELikeButton buttonWithType:UIButtonTypeCustom];
    [self.likeButton setFrame:CGRectMake(self.view.bounds.size.width / 2 - 20, self.view.bounds.size.height / 2 + 100 , 36.0, 32.0)];

    [self.view addSubview:excuseLabel];
    [self.view addSubview:likeButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self resignFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)homeButtonPressed:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        NSString *excuseString = self.excusesArray[arc4random_uniform([self.excusesArray count])][@"excuse"];
        [self.excuseLabel updateLabel:excuseString];
    }
}

@end
