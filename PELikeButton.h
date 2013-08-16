//
//  PELikeButton.h
//  DesignerExcuses
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PELikeButton : UIButton
{
    /* 
     *
        Instead of creating a like button for each excuse
        We have one button, whose state is checked each time the current index changes & then updates the image
     *
     */
    int currentExcuseIndex;
    BOOL currentState;
}

- (void)setCurrentExcuseIndex:(int)num;
- (int)currentExcuseIndex;

@end
