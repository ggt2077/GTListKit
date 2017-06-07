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
#import "GTListAdapterDataSource.h"

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

- (GTListCollectionView *)collectionView {
    return (GTListCollectionView *)_collectionView;
}

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
        
        [self p_updateCollectionViewDelegate];
        [self p_updateAfterPublicSettingsChange];
    }
}


/**
 更新CollectionViewDelegate
 */
- (void)p_updateCollectionViewDelegate {
    // set up the delegate to the proxy so the adapter can intercept evnets
    // default to the adapter simply being the delegate
    _collectionView.delegate = (id<UICollectionViewDelegate>)self.delegateProxy ?: self;
}

- (void)p_updateAfterPublicSettingsChange {
    if (_collectionView != nil && _dataSource != nil) {
        [self updateObjects:[[_dataSource objectsForListAdapter:self] copy]];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


#pragma mark - Private API

// this method is what updates the "source of truth"
// this should only be called just before the collection view is updated
- (void)updateObjects:(NSArray *)objects {
    
#if DEBUG
    for (id object in objects) {
        GTAssert([object isEqual:object], @"Object instance %@ not equal to itself. This will break infra map tables.", object);
    }
#endif
    NSMutableArray *sectionControllers = @[].mutableCopy;
    
}

@end
