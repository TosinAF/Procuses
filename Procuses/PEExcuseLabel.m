//
//  PEExcuseLabel.m
//  Procuses
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#define IOS_NEWER_OR_EQUAL_TO_7 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] >= 7.0 )

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
    CGSize expectedLabelSize = [self text:excuse sizeWithFont:self.font constrainedToSize:maximumLabelSize];
    CGRect newFrame = self.frame;
    newFrame.size.width = 280.0;
    newFrame.size.height = expectedLabelSize.height + 20;
    self.frame = newFrame;
}

- (CGSize)text:(NSString*)text sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size
{
    if(IOS_NEWER_OR_EQUAL_TO_7){
        NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                              font, NSFontAttributeName,
                                              nil];

        CGRect frame = [text boundingRectWithSize:size
                                          options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                       attributes:attributesDictionary
                                          context:nil];

        return frame.size;
    }else{
        return [text sizeWithFont:font constrainedToSize:size];
    }
}

@end
