//
//  GTListAdapterProxy.h
//  GTListKit
//
//  Created by Tony on 17/6/6.
//  Copyright © 2017年 58. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTListMacros.h"

NS_ASSUME_NONNULL_BEGIN

@class GTListAdapter;

GTLK_SUBCLASSING_RESTRICTED
@interface GTListAdapterProxy : NSProxy

- (instancetype)initWithCollectionViewTarget:(nullable id<UICollectionViewDelegate>)collectionViewTarget
                            scrollViewTarget:(nullable id<UIScrollViewDelegate>)scrollViewTarget
                                 interceptor:(GTListAdapter *)interceptor;

@end

NS_ASSUME_NONNULL_END
