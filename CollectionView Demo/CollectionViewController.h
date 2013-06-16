//
//  CollectionViewController.h
//  CollectionView Demo
//
//  Created by Mikkel Selsøe Sørensen on 14/06/13.
//  Copyright (c) 2013 Mikkel Selsøe Sørensen. All rights reserved.
//

@import UIKit;

@interface CollectionViewController : UICollectionViewController

- (instancetype) initWithColor: (UIColor*) startColor count:(NSUInteger)count columnCount:(NSUInteger)colCount;

@end
