//
//  DEViewController.h
//  DesignerExcuses
//
//  Created by Tosin Afolabi on 03/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PELikeButton, PEExcuseLabel;

@interface BaseExcuseViewController : UIViewController

typedef NS_ENUM(NSInteger, PEExcuseType) {
    PEExcuseTypeDesigner,
    PEExcuseTypeDeveloper,
    PEExcuseTypeAccountManger
};

- (id)initWithType:(PEExcuseType)type;

//- (void)click:(PELikeButton *)button;

@end
