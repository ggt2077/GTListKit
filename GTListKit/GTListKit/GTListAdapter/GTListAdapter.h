//
//  GTListAdapter.h
//  GTListKit
//
//  Created by Tony on 17/6/5.
//  Copyright © 2017年 58. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTListMacros.h"

@protocol GTListUpdatingDelegate;
@protocol GTListAdapterDataSource;
@class GTListCollectionView;

NS_ASSUME_NONNULL_BEGIN

GTLK_SUBCLASSING_RESTRICTED
@interface GTListAdapter : NSObject


@property (nonatomic, nullable, weak) UIViewController *viewController;

@property (nonatomic, nullable, weak) GTListCollectionView *collectionView;

@property (nonatomic, nullable, weak) id <GTListAdapterDataSource> dataSource;


/**
 初始构造器

 @param viewController 控制器
 @return 实例对象
 */
- (instancetype)initWithUpdater:(id <GTListUpdatingDelegate>)updatingDelegate
                 viewController:(nullable UIViewController *)viewController
               workingRangeSize:(NSInteger)workingRangeSize NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
