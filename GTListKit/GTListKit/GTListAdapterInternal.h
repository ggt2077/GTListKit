
//
//  GTListAdapterInternal.h
//  GTListKit
//
//  Created by Tony on 17/6/6.
//  Copyright © 2017年 58. All rights reserved.
//

@interface GTListAdapter ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    __weak UICollectionView *_collectionView;
}

@property (nonatomic, strong) id <GTListUpdatingDelegate> updatingDelegate;
@property (nonatomic, strong) NSMutableSet<Class> *registeredCellClass;
@property (nonatomic, strong) NSMutableSet<NSString *> *registeredNibNames;
@property (nonatomic, strong) NSMutableSet<NSString *> *registeredSupplementaryViewIdentifiers;
@property (nonatomic, strong) NSMutableSet<NSString *> *registeredSupplementaryViewNibNames;

@end
