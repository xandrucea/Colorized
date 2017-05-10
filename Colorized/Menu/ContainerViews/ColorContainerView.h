//
//  ColorContainerView.h
//  Colorized
//
//  Created by Alex Cio on 10.05.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorContainerDelegate <NSObject>

- (void)sliderFeedbackColor:(int)colorValue;

@end

@interface ColorContainerView : UIViewController

@property(weak, nonatomic) id<ColorContainerDelegate> myDelegate;

@end
