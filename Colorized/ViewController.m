//
//  ViewController.m
//  Colorized
//
//  Created by Alex Cio on 11.02.17.
//  Copyright © 2017 Alex Cio. All rights reserved.
//

#import "ViewController.h"

#import "MenuViewController.h"
#import "ColorHandler.h"

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
    [self initializeGestures];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/***************************************
 *          MY METHODS                 *
 ***************************************/



- (void)createNumberOfColorsForArray{
    _arrayColors = [ColorHandler getArrayWithColors];
    self.view.backgroundColor = _arrayColors[0];
}

- (void)displayMenu{
    
    self.view.userInteractionEnabled = NO;
    
    MenuViewController *menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    menuVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    menuVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    menuVC.parentVC = (id)self;
    [self presentViewController:menuVC animated:YES completion:^{
        self.view.userInteractionEnabled = YES;
    }];
}

- (void)initializeGestures{
    
    // add gesture for menu
    self.menuTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                           action:@selector(displayMenu)];
    
    self.menuTap.numberOfTapsRequired = 4;
    self.menuTap.delegate = (id)self;
    [self.view addGestureRecognizer:self.menuTap];
}

@end
