//
//  DetailViewController.h
//  CollectionView Demo
//
//  Created by Mikkel Selsøe Sørensen on 14/06/13.
//  Copyright (c) 2013 Mikkel Selsøe Sørensen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) UIColor *color;

- (instancetype)initWithColor:(UIColor *)color;

@end
