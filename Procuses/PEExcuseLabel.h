//
//  PEExcuseLabel.h
//  Procuses
//
//  The Excuses are Displayed in the BaseExcuseView using this subclass of UILabel
//  The Expected Height of the excuse text is obtained & the label size is updated
//  The Width of this label is constrained to a fixed size
//
//  Known Bug - In iOS 7, A thin grey line appears above the Label
//
//  Created by Tosin Afolabi on 04/08/2013.
//  Copyright (c) 2013 Tosin Afolabi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PEExcuseLabel : UILabel

- (void)updateLabel:(NSString *)excuse;

@end
