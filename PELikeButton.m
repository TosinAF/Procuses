//
//  PELikeButton.m
//  DesignerExcuses
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import "PELikeButton.h"

@implementation PELikeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setTitle:@"\u2665" forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont fontWithName:@"Entypo" size:50]];
        [self setTitleColor:[UIColor colorWithRed:0.231 green:0.231 blue:0.231 alpha:1] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:0.922 green:0.133 blue:0.337 alpha:1] forState:UIControlStateSelected];
    }
    return self;
}

- (void)setCurrentExcuseIndex:(int)num
{
    currentExcuseIndex = num;
}

- (int)currentExcuseIndex
{
    return currentExcuseIndex;
}

@end
