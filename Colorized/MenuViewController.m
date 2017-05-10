//
//  MenuViewController.m
//  Colorized
//
//  Created by Alex Cio on 08.05.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UIView *viewAlpha;

@property (strong, nonatomic) ColorContainerView *colorContainer;
@property (strong, nonatomic) TimingContainerView *timingContainer;


@end

@implementation MenuViewController		

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self performSelector:@selector(animateBackground)
               withObject:nil
               afterDelay:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"colorsegue"]) {
        self.colorContainer = (ColorContainerView *) [segue destinationViewController];
        self.colorContainer.myDelegate = (id)self;
    }
    
    if ([segueName isEqualToString: @"timingsegue"]) {
        self.timingContainer = (TimingContainerView *) [segue destinationViewController];
        self.timingContainer.myDelegate = (id)self;
    }
}


/***************************************
 *          MY DELEGATES               *
 ***************************************/

- (void)sliderFeedbackColor:(int)colorValue{
    NSLog(@"Color: %d", colorValue);
}

- (void)sliderFeedbackTiming:(int)timing{
    NSLog(@"Timinig: %d", timing);
}

    /***************************************
     *          MY METHODS                 *
     ***************************************/


- (void)animateBackground{
    
    [UIView animateWithDuration:0.8f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.viewAlpha.alpha = 0.3f;
                     } completion:^(BOOL finished) {
                     }];
}

@end
