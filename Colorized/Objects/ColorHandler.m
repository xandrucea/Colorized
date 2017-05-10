//
//  ColorHandler.m
//  Colorized
//
//  Created by Alex Cio on 10.05.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import "ColorHandler.h"

@implementation ColorHandler

+ (NSMutableArray *)getArrayWithColors{
    
    NSMutableArray *arrayColors = [[NSMutableArray alloc] init];
    for ( int i = 0; i < 7; i++ ){
        //        UIColor *newColor = [UIColor colorWithRed:( arc4random() % 10 * i / 256.0 ) + 0.5
        //                                            green:( arc4random() % 20 * i / 256.0 ) + 0.5
        //                                             blue:( arc4random() % 15 * i / 256.0 ) + 0.5
        //                                            alpha:1];
        
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *newColor = [UIColor colorWithHue:hue
                                       saturation:saturation
                                       brightness:brightness
                                            alpha:1];
        [arrayColors addObject:newColor];
    }
    
    [arrayColors addObject:[UIColor redColor]];
    [arrayColors addObject:[UIColor blueColor]];
    
    return arrayColors;
}

@end
