//
//  GTListSectionController.m
//  GTListKit
//
//  Created by Tony on 17/6/7.
//  Copyright © 2017年 58. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTListSectionController.h"

@protocol GTListCollectionContext;
/**
 分组上下文，为分组提供cell的布局、复用、插入、删除以及reloadData等功能
 */
@interface GTListSectionControllerThreadContext : NSObject
@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) id<GTListCollectionContext> collectionContext;
@end

@implementation GTListSectionController

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

@end
