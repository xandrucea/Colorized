//
//  TimingContainerView.m
//  Colorized
//
//  Created by Alex Cio on 10.05.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import "TimingContainerView.h"

@interface TimingContainerView ()

@property (strong, nonatomic) IBOutlet UISlider *slider;

@end

@implementation TimingContainerView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI * 0.5f);
    self.slider.transform = trans;
    
    self.view.layer.cornerRadius = 18.f;
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderValueChanged:(UISlider *)sender{
    
    if( [self.myDelegate respondsToSelector:@selector(sliderFeedbackTiming:)] ){
        [self.myDelegate sliderFeedbackTiming:(int)sender.value];
        self.view.layer.cornerRadius = 20.0f + (13 * (int)sender.value);
    }
}

@end
