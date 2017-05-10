//
//  MenuViewController.h
//  Colorized
//
//  Created by Alex Cio on 08.05.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimingContainerView.h"
#import "ColorContainerView.h"
#import "EffectContainerView.h"
#import "ViewController.h"

@interface MenuViewController : UIViewController
<TimingContainerDelegate, ColorContainerDelegate, EffectContainerDelegate>

@property ( strong, nonatomic ) ViewController *parentVC;


@end
