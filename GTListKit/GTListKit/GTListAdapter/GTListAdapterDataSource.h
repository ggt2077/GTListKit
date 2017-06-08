//
//  GTListAdapterDataSource.h
//  GTListKit
//
//  Created by Tony on 17/6/7.
//  Copyright © 2017年 58. All rights reserved.
//

#import <UIKit/UIkit.h>

@class GTListAdapter;
@protocol GTListDiffable;

@protocol GTListAdapterDataSource <NSObject>

- (NSArray<id <GTListDiffable>> *)objectsForListAdapter:(GTListAdapter *)listAdapter;

@end



