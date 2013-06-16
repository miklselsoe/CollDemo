//
//  CollectionViewController.m
//  CollectionView Demo
//
//  Created by Mikkel Selsøe Sørensen on 14/06/13.
//  Copyright (c) 2013 Mikkel Selsøe Sørensen. All rights reserved.
//

#import "CollectionViewController.h"
#import "DetailViewController.h"
#import "TransitionLayout.h"


static NSUInteger const kColorCount = 12;
static CGFloat const kSpacing = 16;
static NSString *kCellId = @"CellId";


@interface CollectionViewController () <UINavigationControllerDelegate, UIViewControllerAnimatedTransitioning> {
    NSArray *__colors;
    UICollectionViewFlowLayout *__layout;
}

@end



@implementation CollectionViewController

- (instancetype)init {
    
    if ((self = [self initWithColor:nil count:0 columnCount:3])) {
        
    }
    
    return self;
    
}

- (instancetype) initWithColor: (UIColor*) startColor count: (NSUInteger) count columnCount:(NSUInteger)cols {
    if ((self = [super initWithCollectionViewLayout:[self CV_layoutWithColumnCount:cols]])) {
        
        self.title = @"Colors";
        
        NSUInteger colorCount = count ?: kColorCount;
        
        NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity: colorCount];
        
        CGFloat startRed = 0;
        CGFloat startGreen = 0;
        CGFloat startBlue = 0;
        [startColor getRed:&startRed green:&startGreen blue:&startBlue alpha:nil];
        CGFloat redStepSize =  (1.0-startRed)/colorCount;
        CGFloat greenStepSize =  (1.0-startGreen)/colorCount;
        CGFloat blueStepSize =  (1.0-startBlue)/colorCount;
        
        for (NSUInteger i = 0; i < colorCount; i++) {
            
            UIColor *color = nil;
            if (startColor) {
                color = [[UIColor alloc] initWithRed:startRed + (redStepSize*(i+1)) green:startGreen + (greenStepSize*(i+1)) blue:startBlue + (blueStepSize*(i+1)) alpha:1];
            }
            else {
                color = [[UIColor alloc] initWithRed:arc4random_uniform (255) / 255.0f green:arc4random_uniform (255) / 255.0f blue:arc4random_uniform (255) / 255.0f alpha:1];
            }
            
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
    self.collectionView.contentInset = UIEdgeInsetsMake (kSpacing, 0, 0, 0);
    self.collectionView.alwaysBounceVertical = YES;
    
    self.navigationController.delegate = self;
    
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    CollectionViewController *detailViewController = [[CollectionViewController alloc] initWithColor:cell.backgroundColor count:6 columnCount:2];
    detailViewController.useLayoutToLayoutNavigationTransitions = YES;
    detailViewController.title = @"Nuances";
    
    // Transition to new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}


//- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   animationControllerForOperation:(UINavigationControllerOperation)operation
//                                                fromViewController:(UIViewController *)fromVC
//                                                  toViewController:(UIViewController *)toVC
//{
//    return self;
//}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    NSLog (@"Yup.");
    return 1.0;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
}

- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout {
    
    TransitionLayout *myCustomTransitionLayout = [[TransitionLayout alloc] initWithCurrentLayout:fromLayout nextLayout:toLayout];
    
    return myCustomTransitionLayout;
    
}



#pragma mark - Private Methods


- (UICollectionViewFlowLayout *)CV_layoutWithColumnCount:(NSUInteger)colCount {
    
    if (!__layout) {
        
        
        CGFloat width = roundf ((320 - (colCount - 1) * kSpacing) / colCount);
        
        __layout = [[UICollectionViewFlowLayout alloc] init];
        __layout.itemSize = CGSizeMake (width, width);
        __layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        __layout.minimumLineSpacing = kSpacing;
        
    }
    
    return __layout;
}

@end
