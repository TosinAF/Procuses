//
//  PERootViewController.m
//  Procuses
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "PERootViewController.h"
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
    
    UILabel *accountManagerExcuseLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30, excuseLabelWidth, excuseLabelHeight)];
    [accountManagerExcuseLabel.layer setCornerRadius:8];
    [accountManagerExcuseLabel setText:@"Manager"];
    [accountManagerExcuseLabel setTextColor:[UIColor cloudsColor]];
    [accountManagerExcuseLabel setTextAlignment:NSTextAlignmentCenter];
    [accountManagerExcuseLabel setBackgroundColor:[UIColor greenSeaColor]];
    [accountManagerExcuseLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];
    

    // Designer Excuse Label

    UILabel *designerExcuseLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30 + excuseLabelHeight + excuseLabelSpacing, excuseLabelWidth, excuseLabelHeight)];
    [designerExcuseLabel.layer setCornerRadius:8];
    [designerExcuseLabel setText:@"Designer"];
    [designerExcuseLabel setTextColor:[UIColor cloudsColor]];
    [designerExcuseLabel setTextAlignment:NSTextAlignmentCenter];
    [designerExcuseLabel setBackgroundColor:[UIColor greenSeaColor]];
    [designerExcuseLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];

    // Developer Excuse Label

    UILabel *developerExcuseLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30 + (excuseLabelHeight * 2) + (excuseLabelSpacing * 2), excuseLabelWidth, excuseLabelHeight)];
    [developerExcuseLabel.layer setCornerRadius:8];
    [developerExcuseLabel setText:@"Developer"];
    [developerExcuseLabel setTextColor:[UIColor cloudsColor]];
    [developerExcuseLabel setTextAlignment:NSTextAlignmentCenter];
    [developerExcuseLabel setBackgroundColor:[UIColor greenSeaColor]];
    [developerExcuseLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]];

    // Starred Excuse Label

    UILabel *starredExcuseLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, screenHeight / 2 - 30 + (excuseLabelHeight * 3) + (excuseLabelSpacing * 3), excuseLabelWidth, excuseLabelHeight)];
    [starredExcuseLabel.layer setCornerRadius:8];
    [starredExcuseLabel setText:@"Starred"];
    [starredExcuseLabel setTextColor:[UIColor cloudsColor]];
    [starredExcuseLabel setTextAlignment:NSTextAlignmentCenter];
    [starredExcuseLabel setBackgroundColor:[UIColor colorWithRed:0.922 green:0.133 blue:0.337 alpha:1]];
    [starredExcuseLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:27]];
    
    // Add Subviews to Main View
    
    [self.view addSubview:titleLabel];
    [self.view addSubview:subtitleLabel];
    [self.view addSubview:designerExcuseLabel];
    [self.view addSubview:developerExcuseLabel];
    [self.view addSubview:accountManagerExcuseLabel];
    [self.view addSubview:starredExcuseLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
