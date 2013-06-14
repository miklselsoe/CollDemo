//
//  CollectionViewController.m
//  CollectionView Demo
//
//  Created by Mikkel Selsøe Sørensen on 14/06/13.
//  Copyright (c) 2013 Mikkel Selsøe Sørensen. All rights reserved.
//

#import "CollectionViewController.h"

static NSUInteger const kColorCount = 9;
static NSString *kCellId = @"CellId";


@interface CollectionViewController () {
    NSArray *__colors;
    UICollectionViewFlowLayout *__layout;
}

@end



@implementation CollectionViewController

- (instancetype)init {
    
    if ((self = [super initWithCollectionViewLayout:[self CV_layout]])) {
        
        NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:kColorCount];
        for (NSUInteger i = 0; i < kColorCount; i++) {
            UIColor *color = [[UIColor alloc] initWithRed:arc4random_uniform (255) / 255.0f green:arc4random_uniform (255) / 255.0f blue:arc4random_uniform (255) / 255.0f alpha:1];
            [colors addObject:color];
        }
        __colors = [NSArray arrayWithArray:colors];
        
        
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellId];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake (24, 0, 0, 0);
    self.collectionView.alwaysBounceVertical = YES;
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [__colors count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    
    cell.backgroundColor = __colors[[indexPath item]];
    
    return cell;
    
}



- (UICollectionViewLayout *)CV_layout {
    
    if (!__layout) {
        
        __layout = [[UICollectionViewFlowLayout alloc] init];
        __layout.itemSize = CGSizeMake (100, 100);
        __layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        
    }
    
    return __layout;
}


@end
