//
//  ColorContainerView.m
//  Colorized
//
//  Created by Alex Cio on 10.05.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import "ColorContainerView.h"

@interface ColorContainerView ()

@property ( strong, nonatomic ) IBOutlet UISlider *slider;

@end

@implementation ColorContainerView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI * 0.5f);
    self.slider.transform = trans;
    
    self.view.layer.cornerRadius = 20.0f;
    self.view.backgroundColor = [UIColor lightGrayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)sliderValueChanged:(UISlider *)sender{
    
    if( [self.myDelegate respondsToSelector:@selector(sliderFeedbackColor:)] ){
        [self.myDelegate sliderFeedbackColor:(int)sender.value];
        self.view.layer.cornerRadius = 20.0f + (13 * (int)sender.value);
    }
}


@end
