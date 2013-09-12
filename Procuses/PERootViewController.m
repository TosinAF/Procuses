//
//  PERootViewController.m
//  Procuses
//
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import "FUIButton.h"
#import "UIFont+FlatUI.h"
#import "FUIAlertView.h"
#import "UIColor+FlatUI.h"
#import "SystemVersion.h"
#import "UINavigationBar+FlatUI.h"
#import "PERootViewController.h"
#import "BaseExcuseViewController.h"
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, PERootViewButton) {
    PERootViewButtonDesigner,
    PERootViewButtonDeveloper,
    PERootViewButtonAccountManager

};

BOOL legacyMode;
BOOL excusesDownloaded;

@interface PERootViewController ()

@property (nonatomic, strong) FUIButton *designerExcuseButton;
@property (nonatomic, strong) FUIButton *developerExcuseButton;
@property (nonatomic, strong) FUIButton *accountManagerExcuseButton;

@end

@implementation PERootViewController

- (id)init {

    self = [super init];

    if (self) {
        legacyMode = NO;
        excusesDownloaded = NO;
    }

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleExcusesDownloadedSuccessfully:)
                                                 name:@"ExcusesDownloaded"
                                               object:nil];

    NSString *appTitle = @"Procuses";
    NSString *subtitle = @"AKA Professional Excuses";
    subtitle = [subtitle uppercaseString];
    NSString *aboutTitle = @"Designed & Developed as Part of my 4 Weeks, 4 Apps Challenge. #4in4";
    UIColor *rootBackgroundColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:1];

    CGFloat screenHeight = self.view.bounds.size.height;
    CGFloat excuseLabelWidth = self.view.bounds.size.width - 100;
    CGFloat excuseLabelHeight = self.view.bounds.size.height / 12;
    CGFloat excuseLabelSpacing = 15.0;

    /*************************************************************** Design Code ***********************************************************/

    /*
     * There is A LOT of repeated code here & I need to refactor this ASAP
     */
    
    // Modify the Navigation Bar

    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:rootBackgroundColor];
    [self.view setBackgroundColor:rootBackgroundColor];
    
    // Title Label
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setText:appTitle];
    [titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Light" size:53]];
    [titleLabel setBackgroundColor:rootBackgroundColor];

    CGSize titleLabelSize = [appTitle sizeWithFont:titleLabel.font];
    [titleLabel setFrame:CGRectMake(48, screenHeight / 5 - 40, titleLabelSize.width, titleLabelSize.height)];

    // Subtitle Label
    
    UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [subtitleLabel setText:subtitle];
    [subtitleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Light" size:15]];
    [subtitleLabel setBackgroundColor:rootBackgroundColor];

    CGSize subtitleLabelSize = [subtitle sizeWithFont:subtitleLabel.font];
    [subtitleLabel setFrame:CGRectMake(48, (screenHeight / 5 + titleLabelSize.height) - 40 , subtitleLabelSize.width, subtitleLabelSize.height)];

    // About Label

    UILabel *aboutLabel = [[UILabel alloc] initWithFrame:CGRectMake(48, screenHeight - 130 , subtitleLabelSize.width, 50)];
    [aboutLabel setText:aboutTitle];
    [aboutLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Light" size:13]];
    [aboutLabel setBackgroundColor:rootBackgroundColor];
    [aboutLabel setNumberOfLines:2];
    [aboutLabel setTextAlignment:NSTextAlignmentCenter];

    // Designer Excuse Button

    self.designerExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, (screenHeight / 2 - 30 + excuseLabelHeight + excuseLabelSpacing) - 40, excuseLabelWidth, excuseLabelHeight)];
    [self.designerExcuseButton setShadowHeight:3.0f];
    [self.designerExcuseButton setCornerRadius:6.0f];
    [self.designerExcuseButton setTag:PERootViewButtonDesigner];
    [self.designerExcuseButton setButtonColor:[UIColor turquoiseColor]];
    [self.designerExcuseButton setShadowColor:[UIColor greenSeaColor]];
    [self.designerExcuseButton setTitle:@"Designer" forState:UIControlStateNormal];
    [self.designerExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.designerExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];
    [self.designerExcuseButton addTarget:self action:@selector(menuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    // Developer Excuse Button

    self.developerExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, (screenHeight / 2 - 30 + (excuseLabelHeight * 2) + (excuseLabelSpacing * 2)) - 40, excuseLabelWidth, excuseLabelHeight)];
    [self.developerExcuseButton setShadowHeight:3.0f];
    [self.developerExcuseButton setCornerRadius:6.0f];
    [self.developerExcuseButton setTag:PERootViewButtonDeveloper];
    [self.developerExcuseButton setButtonColor:[UIColor turquoiseColor]];
    [self.developerExcuseButton setShadowColor:[UIColor greenSeaColor]];
    [self.developerExcuseButton setTitle:@"Developer" forState:UIControlStateNormal];
    [self.developerExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.developerExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];
    [self.developerExcuseButton addTarget:self action:@selector(menuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    // Account Manager Excuse Button

    self.accountManagerExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 70, excuseLabelWidth, excuseLabelHeight)];
    [self.accountManagerExcuseButton setShadowHeight:3.0f];
    [self.accountManagerExcuseButton setCornerRadius:6.0f];
    [self.accountManagerExcuseButton setTag:PERootViewButtonAccountManager];
    [self.accountManagerExcuseButton setButtonColor:[UIColor turquoiseColor]];
    [self.accountManagerExcuseButton setShadowColor:[UIColor greenSeaColor]];
    [self.accountManagerExcuseButton setTitle:@"Manager" forState:UIControlStateNormal];
    [self.accountManagerExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.accountManagerExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];
    [self.accountManagerExcuseButton addTarget:self action:@selector(menuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    /*
     *  This is because I wrote the code & tested on an iOS 7 Device First
     *  Thus the position of elements assumes that the status bar is included in the height
     *  When I know how about to decide if an app is to run in Legacy mode
     *  I Can easily switch the code out
     */
    if (!SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        [titleLabel setFrame:CGRectMake(48, screenHeight / 5 - 80, titleLabelSize.width, titleLabelSize.height)];
        [subtitleLabel setFrame:CGRectMake(48, (screenHeight / 5 + titleLabelSize.height) - 80 , subtitleLabelSize.width, subtitleLabelSize.height)];
        [aboutLabel setFrame:CGRectMake(48, screenHeight - 170 , subtitleLabelSize.width, 50)];

        [self.accountManagerExcuseButton setFrame:CGRectMake(50, screenHeight / 2 - 110, excuseLabelWidth, excuseLabelHeight)];
        [self.designerExcuseButton setFrame:CGRectMake(50, (screenHeight / 2 - 30 + excuseLabelHeight + excuseLabelSpacing) - 80, excuseLabelWidth, excuseLabelHeight)];
        [self.developerExcuseButton setFrame:CGRectMake(50, (screenHeight / 2 - 30 + (excuseLabelHeight * 2) + (excuseLabelSpacing * 2)) - 80, excuseLabelWidth, excuseLabelHeight)];
    }

    // Add Subviews to Main View

    [self.view addSubview:titleLabel];
    [self.view addSubview:subtitleLabel];
    [self.view addSubview:aboutLabel];
    [self.view addSubview:self.designerExcuseButton];
    [self.view addSubview:self.developerExcuseButton];
    [self.view addSubview:self.accountManagerExcuseButton];

}

- (void)handleExcusesDownloadedSuccessfully:(NSNotification *)notification
{
    excusesDownloaded = YES;
}

- (void)menuButtonPressed:(id)sender
{
    BaseExcuseViewController *baseExcuseViewContoller;

    if (excusesDownloaded) {

        switch ([sender tag]) {

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

    } else {


        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"No Network Connection" message:@"A network connection is required to download the excuses" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];

        alertView.titleLabel.textColor = [UIColor cloudsColor];
        alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];

        alertView.messageLabel.textColor = [UIColor cloudsColor];
        alertView.messageLabel.font = [UIFont flatFontOfSize:14];
        alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
        alertView.defaultButtonColor = [UIColor cloudsColor];
        alertView.defaultButtonShadowColor = [UIColor asbestosColor];
        alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        alertView.defaultButtonTitleColor = [UIColor asbestosColor];
        
        [alertView show];

    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
