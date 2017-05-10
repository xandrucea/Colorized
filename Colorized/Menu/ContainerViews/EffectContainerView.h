//
//  EffectContainerView.h
//  Colorized
//
//  Created by Alex Cio on 10.05.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EffectStateType) {
    EffectStateTypeNone = 0,
    EffectStateTypeSwitch = 1,
    EffectStateTypeMinify = 2,
    EffectStateTypeMoving = 3
};

@protocol EffectContainerDelegate <NSObject>

- (void)sliderFeedbackEffect:(EffectStateType)effectType;

@end

@interface EffectContainerView : UIViewController

@property ( weak, nonatomic) id<EffectContainerDelegate> myDelegate;

@end
