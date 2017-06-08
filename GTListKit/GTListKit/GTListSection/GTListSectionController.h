//
//  GTListSectionController.h
//  GTListKit
//
//  Created by Tony on 17/6/7.
//  Copyright © 2017年 58. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GTListCollectionContext;
/**
 分组控制器，用于管理分组中的item
 */
@interface GTListSectionController : NSObject

@property (nonatomic, weak, nullable, readonly) UIViewController *viewController;

@property (nonatomic, weak, nullable, readonly) id <GTListCollectionContext> collectionContext;

@property (nonatomic, assign) CGFloat minimumLineSpacing;

@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

@property (nonatomic, assign) UIEdgeInsets inset;

@end
