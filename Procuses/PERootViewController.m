//
//  PERootViewController.m
//  Procuses
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import "FUIButton.h"
#import "UIColor+FlatUI.h"
#import "PERootViewController.h"
#import "BaseExcuseViewController.h"
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, PERootViewButton) {
    PERootViewButtonSettings,
    PERootViewButtonDesigner,
    PERootViewButtonDeveloper,
    PERootViewButtonAccountManager

};

@interface PERootViewController ()

@property (nonatomic, strong) UIButton *settingsButton;
@property (nonatomic, strong) FUIButton *designerExcuseButton;
@property (nonatomic, strong) FUIButton *developerExcuseButton;
@property (nonatomic, strong) FUIButton *accountManagerExcuseButton;
@property (nonatomic, strong) FUIButton *likedExcuseButton;

@end

@implementation PERootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *appTitle = @"Procuses";
    NSString *subtitle = @"AKA Professional Excuses";
    subtitle = [subtitle uppercaseString];
    UIColor *rootBackgroundColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:1];

    CGFloat screenHeight = self.view.bounds.size.height;
    CGFloat excuseLabelWidth = self.view.bounds.size.width - 100;
    CGFloat excuseLabelHeight = self.view.bounds.size.height / 12;
    CGFloat excuseLabelSpacing = 15.0;

    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.view setBackgroundColor:rootBackgroundColor];

    /*************************************************************** Design Code ***********************************************************/

    // Settings Button
    
    self.settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.settingsButton setTag:PERootViewButtonSettings];
    [self.settingsButton setFrame:CGRectMake(0,15,50,50)];
    [self.settingsButton setTitle:@"\u2699" forState:UIControlStateNormal];
    [self.settingsButton.titleLabel setFont:[UIFont fontWithName:@"Entypo" size:40]];
    [self.settingsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.settingsButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // Title Label
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setText:appTitle];
    [titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Light" size:53]];
    [titleLabel setBackgroundColor:rootBackgroundColor];

    CGSize titleLabelSize = [appTitle sizeWithFont:titleLabel.font];
    [titleLabel setFrame:CGRectMake(48, screenHeight / 5, titleLabelSize.width, titleLabelSize.height)];

    // Subtitle Label
    
    UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [subtitleLabel setText:subtitle];
    [subtitleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Light" size:15]];
    [subtitleLabel setBackgroundColor:rootBackgroundColor];

    CGSize subtitleLabelSize = [subtitle sizeWithFont:subtitleLabel.font];
    [subtitleLabel setFrame:CGRectMake(48, screenHeight / 5 + titleLabelSize.height , subtitleLabelSize.width, subtitleLabelSize.height)];


    // Designer Excuse Button

    self.designerExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30 + excuseLabelHeight + excuseLabelSpacing, excuseLabelWidth, excuseLabelHeight)];
    [self.designerExcuseButton setShadowHeight:3.0f];
    [self.designerExcuseButton setCornerRadius:6.0f];
    [self.designerExcuseButton setTag:PERootViewButtonDesigner];
    [self.designerExcuseButton setButtonColor:[UIColor turquoiseColor]];
    [self.designerExcuseButton setShadowColor:[UIColor greenSeaColor]];
    [self.designerExcuseButton setTitle:@"Designer" forState:UIControlStateNormal];
    [self.designerExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.designerExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];
    [self.designerExcuseButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

    // Developer Excuse Button

    self.developerExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30 + (excuseLabelHeight * 2) + (excuseLabelSpacing * 2), excuseLabelWidth, excuseLabelHeight)];
    [self.developerExcuseButton setShadowHeight:3.0f];
    [self.developerExcuseButton setCornerRadius:6.0f];
    [self.developerExcuseButton setTag:PERootViewButtonDeveloper];
    [self.developerExcuseButton setButtonColor:[UIColor turquoiseColor]];
    [self.developerExcuseButton setShadowColor:[UIColor greenSeaColor]];
    [self.developerExcuseButton setTitle:@"Developer" forState:UIControlStateNormal];
    [self.developerExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.developerExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];
    [self.developerExcuseButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

    // Account Manager Excuse Button

    self.accountManagerExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30, excuseLabelWidth, excuseLabelHeight)];
    [self.accountManagerExcuseButton setShadowHeight:3.0f];
    [self.accountManagerExcuseButton setCornerRadius:6.0f];
    [self.accountManagerExcuseButton setTag:PERootViewButtonAccountManager];
    [self.accountManagerExcuseButton setButtonColor:[UIColor turquoiseColor]];
    [self.accountManagerExcuseButton setShadowColor:[UIColor greenSeaColor]];
    [self.accountManagerExcuseButton setTitle:@"Manager" forState:UIControlStateNormal];
    [self.accountManagerExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.accountManagerExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];
    [self.accountManagerExcuseButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

    // Liked Excuse Button

    self.likedExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30 + (excuseLabelHeight * 3) + (excuseLabelSpacing * 3), excuseLabelWidth, excuseLabelHeight)];
    [self.likedExcuseButton setShadowHeight:3.0f];
    [self.likedExcuseButton setCornerRadius:6.0f];
    [self.likedExcuseButton setTag:4];
    [self.likedExcuseButton setButtonColor:[UIColor colorWithRed:0.922 green:0.133 blue:0.337 alpha:1]];
    [self.likedExcuseButton setShadowColor:[UIColor colorWithRed:0.710 green:0.314 blue:0.416 alpha:1]];
    [self.likedExcuseButton setTitle:@"<3" forState:UIControlStateNormal];
    [self.likedExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.likedExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];
    [self.likedExcuseButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // Add Subviews to Main View

    [self.view addSubview:titleLabel];
    [self.view addSubview:subtitleLabel];
    [self.view addSubview:self.settingsButton];
    [self.view addSubview:self.designerExcuseButton];
    [self.view addSubview:self.developerExcuseButton];
    [self.view addSubview:self.accountManagerExcuseButton];
    [self.view addSubview:self.likedExcuseButton];

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)buttonPressed:(id)sender
{
    BaseExcuseViewController *baseExcuseViewContoller;

    switch ([sender tag]) {

        case PERootViewButtonSettings:
            NSLog(@"Settings Button was Pressed");
            break;

        case PERootViewButtonDesigner:
            NSLog(@"Designer Button was Pressed");
            baseExcuseViewContoller = [[BaseExcuseViewController alloc] initWithType:PEExcuseTypeDesigner];
            [self.navigationController pushViewController:baseExcuseViewContoller animated:YES];
            break;

        case PERootViewButtonDeveloper:
            baseExcuseViewContoller = [[BaseExcuseViewController alloc] initWithType:PEExcuseTypeDeveloper];
            [self.navigationController pushViewController:baseExcuseViewContoller animated:YES];
            break;

        case PERootViewButtonAccountManager:
            baseExcuseViewContoller = [[BaseExcuseViewController alloc] initWithType:PEExcuseTypeAccountManger];
            [self.navigationController pushViewController:baseExcuseViewContoller animated:YES];
            break;

        default:
            NSLog(@"8 doobies to the face, fuck that");
            break;
    }
}

@end
