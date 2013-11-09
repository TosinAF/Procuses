//
//  PEMenuViewController.m
//  Procuses
//
//  Created by Tosin Afolabi on 09/11/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#define OPTIONS_CELL_HEIGHT 60
#define NUMBER_OF_OPTIONS 3

#import "PEMenuViewController.h"
#import "PEExcuseViewController.h"

@interface PEMenuViewController ()

@property (nonatomic, strong) UITableView *optionsTableView;

@end

@implementation PEMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.914 green:0.380 blue:0.318 alpha:1]];

    UILabel *menuTitle = [[UILabel alloc] initWithFrame:CGRectMake(110, 70, 100, 45)];
    [menuTitle setText:@"Procuses"];
    [menuTitle setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:30]];
    [menuTitle setTextColor:[UIColor whiteColor]];
    [menuTitle setTextAlignment:NSTextAlignmentCenter];

    UILabel *bottomTitle = [[UILabel alloc] initWithFrame:CGRectMake(50, 470, 220, 45)];
    [bottomTitle setText:@"AKA PROFESSIONAL EXCUSES"];
    [bottomTitle setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:15]];
    [bottomTitle setTextColor:[UIColor whiteColor]];
    [bottomTitle setTextAlignment:NSTextAlignmentCenter];

    self.optionsTableView = [[UITableView alloc] initWithFrame:CGRectMake(45, 200, 230, OPTIONS_CELL_HEIGHT * NUMBER_OF_OPTIONS) style:UITableViewStylePlain];
    [self.optionsTableView setDelegate:self];
    [self.optionsTableView setDataSource:self];

    [self.optionsTableView setBackgroundColor:[UIColor clearColor]];
    [self.optionsTableView setSeparatorColor:[UIColor colorWithRed:0.933 green:0.514 blue:0.463 alpha:1]];
    [self.optionsTableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 50, 0)];
    [self.optionsTableView setScrollEnabled:NO];

    [self.view addSubview:menuTitle];
    [self.view addSubview:bottomTitle];
    [self.view addSubview:self.optionsTableView];
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return NUMBER_OF_OPTIONS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

    NSNumber *indexPathRow = [NSNumber numberWithInt:[indexPath row]];

    switch ([indexPathRow integerValue]) {

        case PEExcuseTypeAccountManger:
            [[cell textLabel] setText:@"Account Manager"];
            break;

        case PEExcuseTypeDeveloper:
            [[cell textLabel] setText:@"Developer"];
            break;

        case PEExcuseTypeDesigner:
            [[cell textLabel] setText:@"Designer"];
            break;
    }

    [cell setBackgroundColor:[UIColor clearColor]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [[cell textLabel] setTextColor:[UIColor whiteColor]];
    [[cell textLabel] setFont:[UIFont fontWithName:@"JosefinSans-Bold" size:20]];
    [[cell textLabel] setTextAlignment:NSTextAlignmentCenter];

    return cell;
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return OPTIONS_CELL_HEIGHT;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *indexPathRow = [NSNumber numberWithInt:[indexPath row]];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    [[cell layer] setBorderWidth:2];
    [[cell layer] setBorderColor:[UIColor whiteColor].CGColor];

    switch ([indexPathRow integerValue]) {

        case PEExcuseTypeAccountManger:
            [self.delegate menuViewController:self didChooseExcuseType:PEExcuseTypeAccountManger];
            break;

        case PEExcuseTypeDeveloper:
            [self.delegate menuViewController:self didChooseExcuseType:PEExcuseTypeDeveloper];
            break;

        case PEExcuseTypeDesigner:
            [self.delegate menuViewController:self didChooseExcuseType:PEExcuseTypeDesigner];
            break;
    }

    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
    return nil;
}

@end
