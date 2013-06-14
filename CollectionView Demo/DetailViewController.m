//
//  DetailViewController.m
//  CollectionView Demo
//
//  Created by Mikkel Selsøe Sørensen on 14/06/13.
//  Copyright (c) 2013 Mikkel Selsøe Sørensen. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (instancetype)initWithColor:(UIColor *)color {
    
    if ((self = [super init])) {
        self.color = color;
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = self.color;
    
    UIGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (CV_handleTap:)];
    [self.view addGestureRecognizer:tapRecognizer];
    
}


- (void)CV_handleTap:(UITapGestureRecognizer *)tapRecognizer {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
