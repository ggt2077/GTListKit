//
//  GTListCollectionView.h
//  GTListKit
//
//  Created by Tony on 17/6/5.
//  Copyright © 2017年 58. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTListMacros.h"

GTLK_SUBCLASSING_RESTRICTED
@interface GTListCollectionView : UICollectionView

- (void)reloadData GTLK_UNAVAILABLE("Call -[GTListAdapter reloadDataWithCompletion:] instead");

@end
