//
//  PERootViewController.m
//  Procuses
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "PERootViewController.h"
#import "FUIButton.h"
#import "UIColor+FlatUI.h"

@interface PERootViewController ()

@end

@implementation PERootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    /*************************************************************** Design Code ***********************************************************/

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

    // Title Label
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [titleLabel setText:appTitle];
    [titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Light" size:53]];
    [titleLabel setBackgroundColor:rootBackgroundColor];

    CGSize titleLabelSize = [appTitle sizeWithFont:titleLabel.font];
    [titleLabel setFrame:CGRectMake(48, screenHeight / 5, titleLabelSize.width, titleLabelSize.height)];

    // Subtitle Label
    
    UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [subtitleLabel setText:subtitle];
    [subtitleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Light" size:15]];
    [subtitleLabel setBackgroundColor:rootBackgroundColor];

    CGSize subtitleLabelSize = [subtitle sizeWithFont:subtitleLabel.font];
    [subtitleLabel setFrame:CGRectMake(48, screenHeight / 5 + titleLabelSize.height , subtitleLabelSize.width, subtitleLabelSize.height)];

    // Account Manager Excuse Label
    
    FUIButton *accountManagerExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30, excuseLabelWidth, excuseLabelHeight)];
    [accountManagerExcuseButton setShadowHeight:3.0f];
    [accountManagerExcuseButton setCornerRadius:6.0f];
    [accountManagerExcuseButton setButtonColor:[UIColor turquoiseColor]];
    [accountManagerExcuseButton setShadowColor:[UIColor greenSeaColor]];
    [accountManagerExcuseButton setTitle:@"Manager" forState:UIControlStateNormal];
    [accountManagerExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [accountManagerExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];

    // Designer Excuse Label

    FUIButton *designerExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30 + excuseLabelHeight + excuseLabelSpacing, excuseLabelWidth, excuseLabelHeight)];
    [designerExcuseButton setShadowHeight:3.0f];
    [designerExcuseButton setCornerRadius:6.0f];
    [designerExcuseButton setButtonColor:[UIColor turquoiseColor]];
    [designerExcuseButton setShadowColor:[UIColor greenSeaColor]];
    [designerExcuseButton setTitle:@"Designer" forState:UIControlStateNormal];
    [designerExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [designerExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];

    // Developer Excuse Label

    FUIButton *developerExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30 + (excuseLabelHeight * 2) + (excuseLabelSpacing * 2), excuseLabelWidth, excuseLabelHeight)];
    [developerExcuseButton setShadowHeight:3.0f];
    [developerExcuseButton setCornerRadius:6.0f];
    [developerExcuseButton setButtonColor:[UIColor turquoiseColor]];
    [developerExcuseButton setShadowColor:[UIColor greenSeaColor]];
    [developerExcuseButton setTitle:@"Developer" forState:UIControlStateNormal];
    [developerExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [developerExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];
    

    // Starred Excuse Label

    FUIButton *starredExcuseButton = [[FUIButton alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30 + (excuseLabelHeight * 3) + (excuseLabelSpacing * 3), excuseLabelWidth, excuseLabelHeight)];
    [starredExcuseButton setShadowHeight:3.0f];
    [starredExcuseButton setCornerRadius:6.0f];
    [starredExcuseButton setButtonColor:[UIColor colorWithRed:0.922 green:0.133 blue:0.337 alpha:1]];
    [starredExcuseButton setShadowColor:[UIColor colorWithRed:0.710 green:0.314 blue:0.416 alpha:1]];
    [starredExcuseButton setTitle:@"<3" forState:UIControlStateNormal];
    [starredExcuseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [starredExcuseButton.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];
    
    // Add Subviews to Main View
    
    [self.view addSubview:titleLabel];
    [self.view addSubview:subtitleLabel];
    [self.view addSubview:designerExcuseButton];
    [self.view addSubview:developerExcuseButton];
    [self.view addSubview:accountManagerExcuseButton];
    [self.view addSubview:starredExcuseButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
