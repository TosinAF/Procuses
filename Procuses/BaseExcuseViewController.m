//
//  BaseExcuseViewController.m
//  Procuses
//
//  Created by Tosin Afolabi on 03/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import "PEAppDelegate.h"
#import "SystemVersion.h"
#import "PEExcuseLabel.h"
#import "BaseExcuseViewController.h"
#import "UINavigationBar+FlatUI.h"

#define UIAppDelegate ((PEAppDelegate *)[UIApplication sharedApplication].delegate)

@interface BaseExcuseViewController ()

@property (nonatomic, copy) NSString *navBarTitle;
@property (nonatomic, copy) NSArray *excusesArray;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UILabel *emojiLabel;
@property (nonatomic, strong) PELikeButton *likeButton;
@property (nonatomic, strong) PEExcuseLabel *excuseLabel;

@end

@implementation BaseExcuseViewController

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

    CGFloat screenHeight = self.view.bounds.size.height;
    self.title = self.navBarTitle;
    UIColor *backgroundColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:1];
    self.view.backgroundColor = backgroundColor;

    // Navigation Bar

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
    
    self.excuseLabel = [[PEExcuseLabel alloc] initWithFrame:CGRectMake(20.0, 100.0, 0.0, 0.0)];
    [self.excuseLabel setBackgroundColor:backgroundColor];
    [self.excuseLabel setFont:[UIFont fontWithName:@"Didot" size:40]];

    [self getExcuse];

    [self.view addSubview:self.excuseLabel];

    // Label That Tells the User how to get a new Excuse
    // Is Shown the first time the BaseExcuseView is in View & never again

    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"learntHowToGetNewExcuse"]) {

        NSString *infoTitle = @"Shake to get a New Excuse!";
        self.infoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.infoLabel setText:infoTitle];
        [self.infoLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Light" size:18]];
        [self.infoLabel setBackgroundColor:backgroundColor];
        [self.infoLabel setTextAlignment:NSTextAlignmentCenter];

        CGSize infoLabelSize = [infoTitle sizeWithFont:self.infoLabel.font];
        [self.infoLabel setFrame:CGRectMake(30, screenHeight - 150, infoLabelSize.width, infoLabelSize.height)];

        NSString *emojiSmiley = @"\ue415";
        self.emojiLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.emojiLabel setText:emojiSmiley];
        [self.emojiLabel setFont:[UIFont fontWithName:@"AppleColorEmoji" size:18]];
        [self.emojiLabel setBackgroundColor:backgroundColor];
        [self.emojiLabel setTextAlignment:NSTextAlignmentCenter];

        CGSize emojiLabelSize = [emojiSmiley sizeWithFont:self.emojiLabel.font];
        [self.emojiLabel setFrame:CGRectMake(30 + infoLabelSize.width, screenHeight - 150, emojiLabelSize.width + 5, emojiLabelSize.height)];

        [self.view addSubview:self.infoLabel];
        [self.view addSubview:self.emojiLabel];

        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"learntHowToGetNewExcuse"];
    }
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
        [self getExcuse];
    }
}

#pragma mark - Helper Methods

- (void)getExcuse
{
    NSString *excuseString = self.excusesArray[arc4random_uniform([self.excusesArray count])][@"excuse"];
    [self.excuseLabel updateLabel:excuseString];

    if ([self.view.subviews containsObject:self.infoLabel]) {
        NSLog(@"I was here");
        [self.infoLabel removeFromSuperview];
        [self.emojiLabel removeFromSuperview];
    }
}

@end
