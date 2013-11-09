//
//  PEExcuseViewController.h
//  Procuses
//
//  Created by Tosin Afolabi on 09/11/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PEMenuViewController.h"

@interface PEExcuseViewController : UIViewController <PEMenuViewControllerDelegate>

typedef NS_ENUM(NSInteger, PEExcuseType) {
    PEExcuseTypeAccountManger,
    PEExcuseTypeDeveloper,
    PEExcuseTypeDesigner
};

@end
