//
//  EffectContainerView.m
//  Colorized
//
//  Created by Alex Cio on 10.05.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import "EffectContainerView.h"

@interface EffectContainerView ()

@property (weak, nonatomic) IBOutlet UISlider *sliderEffect;

@end

@implementation EffectContainerView

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)sliderValueChanged:(UISlider *)sender{
    
    if( [self.myDelegate respondsToSelector:@selector(sliderFeedbackEffect:)] ){
        [self.myDelegate sliderFeedbackEffect:(int)sender.value];
        self.view.layer.cornerRadius = 20.0f + (13 * (int)sender.value);
    }
}

@end
