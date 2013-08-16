//
//  DEViewController.m
//  DesignerExcuses
//
//  Created by Tosin Afolabi on 03/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import "DEViewController.h"
#import "DELikeButton.h"
#import "DEExcuseLabel.h"

@interface DEViewController ()

@end

@implementation DEViewController

@synthesize excuseLabel, likeButton;

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

    // Set Up Resources
    
    UIColor *desingerExcuseBackgroundColor = [UIColor colorWithRed:0.941 green:0.941 blue:0.918 alpha:1];
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"DesignerExcuses" ofType:@"plist"];
    self.excusesArray = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    int excuseIndex = [self getNewExcuseIndex];
    NSString *excuseString = [self getNewExcuseString:excuseIndex];
    
    // Set Up View Elements
    
    [self.view setBackgroundColor:desingerExcuseBackgroundColor];
    self.excuseLabel = [[DEExcuseLabel alloc] initWithFrame:CGRectMake(20.0, 130.0, 0.0, 0.0)];
    self.likeButton = [DELikeButton buttonWithType:UIButtonTypeCustom];

    // Add View's to the Main Window
    
    [self.view addSubview:excuseLabel];
    [self.view addSubview:likeButton];

    // excuseLabel Initial Properties
    
    [self.excuseLabel setBackgroundColor:desingerExcuseBackgroundColor];
    [self.excuseLabel setFont:[UIFont fontWithName:@"Didot" size:40]];
    [self.excuseLabel updateLabel:excuseString];

    // likeButton Initial Properties
    
    [self.likeButton setFrame:CGRectMake(self.view.bounds.size.width / 2 - 20, self.view.bounds.size.height / 2 + 100 , 36.0, 32.0)];
    [self checkExcuseLikeStatus:excuseIndex];
    [self.likeButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)getNewExcuseIndex
{
    int excuseIndex = arc4random() % [self.excusesArray count];

    if (self.excusesArray[excuseIndex][@"favourite"] == [NSNumber numberWithBool:1])
        likeButton.selected = YES;
    else
        likeButton.selected = NO;

    // Passes the current index so that the Click action can access the current index
    [self.likeButton setCurrentExcuseIndex:excuseIndex];

    return excuseIndex;
}

- (NSString*)getNewExcuseString:(int)excuseIndex
{
    return self.excusesArray[excuseIndex][@"excuse"];
}

// For updating the Like Button When a New Excuse is Shown
- (void)checkExcuseLikeStatus:(int)excuseIndex
{
    if (self.excusesArray[excuseIndex][@"favourite"] == [NSNumber numberWithBool:1])
        likeButton.selected = YES;
    else
        likeButton.selected = NO;
}

- (void)click:(DELikeButton *)button
{
    if (likeButton.selected == YES) {

        likeButton.selected = NO;
        self.excusesArray[[button currentExcuseIndex]][@"favourite"] = [NSNumber numberWithBool:NO];
        NSLog(@"imh here, deseelct");

    } else {

        likeButton.selected = YES;
        self.excusesArray[[button currentExcuseIndex]][@"favourite"] = [NSNumber numberWithBool:YES];
        NSLog(@"select, select, select");
    }

}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        NSLog(@"Device Was Shook, New Excuse Should Be Displayed");

        int excuseIndex = [self getNewExcuseIndex];
        NSString *excuseString = [self getNewExcuseString:excuseIndex];
        [self.excuseLabel updateLabel:excuseString];
        [self checkExcuseLikeStatus:excuseIndex];
    }
}

@end
