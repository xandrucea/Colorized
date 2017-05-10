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
@property (strong, nonatomic) EffectContainerView *effetContainer;

@end

@implementation MenuViewController		

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeMenu];
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
    
    if( [segueName isEqualToString:@"effectsegue"] ){
        self.effetContainer = (EffectContainerView *) [segue destinationViewController];
        self.effetContainer.myDelegate = (id)self;
    }
}


/***************************************
 *          MY DELEGATES               *
 ***************************************/

- (void)initializeMenu{
    _tapExitMenu = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                           action:@selector(dismissMenu)];
    _tapExitMenu.numberOfTapsRequired = 2;
    _tapExitMenu.delegate = (id)self;
    [self.view addGestureRecognizer:_tapExitMenu];
}

- (void)sliderFeedbackColor:(int)colorValue{
    NSLog(@"Color: %d", colorValue);
}

- (void)sliderFeedbackTiming:(int)timing{
    NSLog(@"Timinig: %d", timing);
}

- (void)sliderFeedbackEffect:(EffectStateType)effectType{
    NSLog(@"EffectType: %ld", (long)effectType);
}

- (void)dismissMenu{
    [self dismissViewControllerAnimated:YES completion:nil];
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


- (IBAction)buttonExit:(id)sender {
    exit(0);
}

- (IBAction)buttonNewColorset:(id)sender {
    [self.parentVC createNumberOfColorsForArray];
}

@end
