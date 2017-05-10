//
//  TimingContainerView.h
//  Colorized
//
//  Created by Alex Cio on 10.05.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimingContainerDelegate <NSObject>

- (void)sliderFeedbackTiming:(int)timing;

@end

@interface TimingContainerView : UIViewController

@property (weak, nonatomic) id<TimingContainerDelegate> myDelegate;

@end
