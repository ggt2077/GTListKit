//
//  GTListAdapter.m
//  GTListKit
//
//  Created by Tony on 17/6/5.
//  Copyright © 2017年 58. All rights reserved.
//

#import "GTListAdapter.h"
#import "GTListAssert.h"
#import "GTListUpdatingDelegate.h"
#import "GTListAdapterInternal.h"
#import "GTListCollectionView.h"

@implementation GTListAdapter

#pragma mark - init

- (instancetype)initWithUpdater:(id <GTListUpdatingDelegate>)updatingDelegate
                 viewController:(nullable UIViewController *)viewController
               workingRangeSize:(NSInteger)workingRangeSize {
    GTAssertMainThread();
    GTParameterAssert(updatingDelegate);
    
    if (self = [super init]) {
        // 留待观察
//        NSPointerFunctions *keyFunctions = [updatingDelegate objectLookupPointerFunctions];
//        NSPointerFunctions *valueFunctions = [NSPointerFunctions pointerFunctionsWithOptions:NSPointerFunctionsStrongMemory];
//        NSMapTable *table = [[NSMapTable alloc] initWithKeyOptions:keyFunctions valueOptions:valueFunctions capacity:0];
        _updatingDelegate = updatingDelegate;
        _viewController = viewController;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


#pragma mark -  Setter

- (void)setCollectionView:(GTListCollectionView *)collectionView {
    GTAssertMainThread();
    GTParameterAssert([collectionView isKindOfClass:[GTListCollectionView class]]);
    
    if (_collectionView != collectionView || _collectionView.dataSource != self) {
        _registeredCellClass = [NSMutableSet new];
        _registeredNibNames = [NSMutableSet new];
        
        _registeredSupplementaryViewNibNames = [NSMutableSet new];
        _registeredSupplementaryViewIdentifiers = [NSMutableSet new];
        
        _collectionView = collectionView;
        _collectionView.dataSource = self;
    }
}

#pragma mark -  Getter

- (GTListCollectionView *)collectionView {
    return (GTListCollectionView *)_collectionView;
}

@end
