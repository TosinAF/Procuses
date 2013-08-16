//
//  DEViewController.h
//  DesignerExcuses
//
//  Created by Tosin Afolabi on 03/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DELikeButton, DEExcuseLabel;

@interface DEViewController : UIViewController
{
    
}

@property (nonatomic,copy) NSArray *excusesArray;
@property (nonatomic,strong) DEExcuseLabel *excuseLabel;
@property (nonatomic, strong) DELikeButton *likeButton;

- (void)click:(DELikeButton *)button;

@end
