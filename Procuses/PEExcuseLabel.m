//
//  PEExcuseLabel.m
//  Procuses
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import "PEExcuseLabel.h"

@implementation PEExcuseLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Properties that all Excuse Labels Should Have
        [self setTextAlignment:NSTextAlignmentCenter];
        [self setNumberOfLines:0];
    }
    return self;
}

- (void)setExcuse:(NSString *)excuse
{
    [self setText:excuse];

    // Get Expected Size of String & Adjust Size of Label to Fit
    CGSize maximumLabelSize = CGSizeMake(280,200);
    CGSize expectedLabelSize = [excuse sizeWithFont:self.font constrainedToSize:maximumLabelSize];
    CGRect newFrame = self.frame;
    newFrame.size.width = 280.0;
    newFrame.size.height = expectedLabelSize.height + 20;
    self.frame = newFrame;
}

@end
