
//
//  GTListAdapterInternal.h
//  GTListKit
//
//  Created by Tony on 17/6/6.
//  Copyright © 2017年 58. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@class GTListAdapterProxy;

@interface GTListAdapter ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    __weak UICollectionView *_collectionView;
}

@property (nonatomic, strong) id <GTListUpdatingDelegate> updatingDelegate;
@property (nonatomic, strong, readonly) NSMutableSet<Class> *registeredCellClass;
@property (nonatomic, strong, readonly) NSMutableSet<NSString *> *registeredNibNames;
@property (nonatomic, strong, readonly) NSMutableSet<NSString *> *registeredSupplementaryViewIdentifiers;
@property (nonatomic, strong, readonly) NSMutableSet<NSString *> *registeredSupplementaryViewNibNames;

@property (nonatomic, strong, nullable) GTListAdapterProxy *delegateProxy;

@end

NS_ASSUME_NONNULL_END
