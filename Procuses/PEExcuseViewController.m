//
//  PEExcuseViewController.m
//  Procuses
//
//  Created by Tosin Afolabi on 09/11/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//


#import <Parse/Parse.h>
#import "PEExcuseLabel.h"
#import "PEExcuseViewController.h"

@interface PEExcuseViewController ()

@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIButton *menuButton;
@property (nonatomic, strong) PEExcuseLabel *excuseLabel;
@property (nonatomic, strong) PEMenuViewController *menuViewController;

@property (nonatomic, strong) NSArray *excusesArray;
@property (nonatomic, strong) NSMutableArray *designerExcuses;
@property (nonatomic, strong) NSMutableArray *developerExcuses;
@property (nonatomic, strong) NSMutableArray *accountManagerExcuses;

@end

@implementation PEExcuseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Excuse Label

    self.excuseLabel = [[PEExcuseLabel alloc] initWithFrame:CGRectMake(20, 100, 300,150)];
    [self.excuseLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:50]];
    [self.excuseLabel setTextColor:[UIColor whiteColor]];
    [self.excuseLabel setTextAlignment:NSTextAlignmentCenter];

    // Menu Button

    self.menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.menuButton setTitle:@"MENU" forState:UIControlStateNormal];
    [self.menuButton.titleLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:18]];
    [self.menuButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.menuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.menuButton setTitleColor:[UIColor colorWithRed:0.616 green:0.855 blue:0.620 alpha:1] forState:UIControlStateHighlighted];
    [self.menuButton setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateHighlighted];
    [self.menuButton addTarget:self action:@selector(menuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    [[self.menuButton layer] setBorderWidth:3];
    [[self.menuButton layer] setBorderColor:[UIColor whiteColor].CGColor];

    [self getExcusesFromParse];
    [self updateExcuseLabel];

    self.infoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"infoLabelShown"]) {

        [self.infoLabel setText:@"Shake to get a New Excuse!"];
        [self.infoLabel setTextColor:[UIColor whiteColor]];
        [self.infoLabel setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:18]];
        [self.infoLabel setBackgroundColor:[UIColor clearColor]];
        [self.infoLabel setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:self.infoLabel];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"infoLabelShown"];
    }

    // Position Changes for 3.5 inch Devices
    if (self.view.bounds.size.height == 568) {

        [self.menuButton setFrame:CGRectMake(110, 420, 100, 50)];
        [self.infoLabel setFrame:CGRectMake(0, 490, self.view.bounds.size.width, 40)];

    } else {
        
        [self.menuButton setFrame:CGRectMake(110, 370, 100, 50)];
        [self.infoLabel setFrame:CGRectMake(0, 430, self.view.bounds.size.width, 40)];
    }

    [self.view addSubview:self.excuseLabel];
    [self.view addSubview:self.menuButton];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self resignFirstResponder];
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        [self updateExcuseLabel];
    }
}

- (void)menuViewController:(PEMenuViewController *)viewController didChooseExcuseType:(int)excuseType
{
    [self setExcuseType:excuseType];
    [self updateExcuseLabel];
}

- (void)menuButtonPressed:(id)selector
{
    self.menuViewController = [[PEMenuViewController alloc] init];
    [self.menuViewController setDelegate:self];

    [self presentViewController:self.menuViewController animated:YES completion:nil];
}

#pragma mark - Private Methods

- (void)getExcusesFromParse
{
    self.designerExcuses = [[NSMutableArray alloc] init];
    self.developerExcuses = [[NSMutableArray alloc] init];
    self.accountManagerExcuses = [[NSMutableArray alloc] init];

    // Local Excuses in the event that Parse Fails
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"LocalExcuses" ofType:@"plist"];
    NSArray *excusesArray = [NSArray arrayWithContentsOfFile:filePath];

    for (NSDictionary *excuse in excusesArray) {
        if ([excuse[@"excuseType"] isEqualToString:@"Designer"]) {
            [self.designerExcuses addObject:excuse];
        } else if ([excuse[@"excuseType"] isEqualToString:@"Developer"]) {
            [self.developerExcuses addObject:excuse];
        } else if ([excuse[@"excuseType"] isEqualToString:@"AccountManager"]) {
            [self.accountManagerExcuses addObject:excuse];
        }
    }

    PFQuery *query = [PFQuery queryWithClassName:@"Excuses"];
    query.cachePolicy = kPFCachePolicyNetworkElseCache;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {

            for (PFObject *excuse in objects) {
                if ([excuse[@"excuseType"] isEqualToString:@"Designer"]) {
                    [self.designerExcuses addObject:excuse];
                } else if ([excuse[@"excuseType"] isEqualToString:@"Developer"]) {
                    [self.developerExcuses addObject:excuse];
                } else if ([excuse[@"excuseType"] isEqualToString:@"AccountManager"]) {
                    [self.accountManagerExcuses addObject:excuse];
                }
            }

        } else {
            NSLog(@"%@", [error userInfo]);
        }
    }];

    [self setExcuseType:arc4random_uniform(3)];

}

- (void)updateExcuseLabel
{
    NSString *excuseString = self.excusesArray[arc4random_uniform([self.excusesArray count])][@"excuse"];
    [self.excuseLabel setExcuse:excuseString];

    if ([self.view.subviews containsObject:self.infoLabel]) {
        [self.infoLabel removeFromSuperview];
    }
}

- (void)setExcuseType:(PEExcuseType)excuseType
{
    UIColor *backgroundColor;

    switch (excuseType) {
        case PEExcuseTypeAccountManger:
            self.excusesArray = self.accountManagerExcuses;
            backgroundColor = [UIColor colorWithRed:0.616 green:0.855 blue:0.620 alpha:1];
            break;

        case PEExcuseTypeDeveloper:
            self.excusesArray = self.developerExcuses;
            backgroundColor = [UIColor colorWithRed:0.294 green:0.780 blue:0.898 alpha:1];
            break;

        case PEExcuseTypeDesigner:
            self.excusesArray = self.designerExcuses;
            backgroundColor = [UIColor colorWithRed:0.800 green:0.800 blue:1.000 alpha:1];
            break;
    }

    [self.view setBackgroundColor:backgroundColor];
    [self.menuButton setTitleColor:backgroundColor forState:UIControlStateHighlighted];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
