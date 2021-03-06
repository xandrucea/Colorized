//
//  ViewController.m
//  Colorized
//
//  Created by Alex Cio on 11.02.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+HexColor.h"

@interface ViewController ()

@end

@implementation ViewController

    int _numberOfColors;

    NSMutableArray *_arrayColors;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrayColors = [[NSMutableArray alloc] init];
    

    [self createNumberOfColorsForArray];
    
    self.singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                             action:@selector(createNumberOfColorsForArray)];
    self.singleTap.numberOfTapsRequired = 5;
    self.singleTap.delegate = (id)self;
    [self.view addGestureRecognizer:self.singleTap];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches
//           withEvent:(UIEvent *)event{
//    
//    [self createNumberOfColorsForArray];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)createNumberOfColorsForArray{
 
    _arrayColors = [[NSMutableArray alloc] init];
    for ( int i = 0; i < 7; i++ ){
//        UIColor *newColor = [UIColor colorWithRed:( arc4random() % 10 * i / 256.0 ) + 0.5
//                                            green:( arc4random() % 20 * i / 256.0 ) + 0.5
//                                             blue:( arc4random() % 15 * i / 256.0 ) + 0.5
//                                            alpha:1];
        
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *newColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        [_arrayColors addObject:newColor];
    }
    
    [_arrayColors addObject:[UIColor redColor]];
    [_arrayColors addObject:[UIColor blueColor]];
    
    self.view.backgroundColor = _arrayColors[(int)self.sliderColors.value];
}

- (IBAction)sliderValueChanged:(UISlider *)sender{
    NSLog(@"Color selected %d", (int)sender.value);
    UIColor *nextColor = _arrayColors[(int)sender.value];
    self.view.backgroundColor = nextColor;

    
}

@end
