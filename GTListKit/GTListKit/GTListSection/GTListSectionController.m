//
//  GTListSectionController.m
//  GTListKit
//
//  Created by Tony on 17/6/7.
//  Copyright © 2017年 58. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTListSectionController.h"
#import "GTListAssert.h"
#import "GTListMacros.h"

@protocol GTListCollectionContext;

/**
 线程上下文
 */
@interface GTListSectionControllerThreadContext : NSObject
@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) id<GTListCollectionContext> collectionContext;
@end

@implementation GTListSectionControllerThreadContext
@end

/****************************************************************************/

static NSString * const kGTListSectionControllerThreadKey = @"kGTListSectionControllerThreadKey";

static NSMutableArray *threadContextStack(void) {
    GTAssertMainThread();
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSMutableArray *stack = threadDictionary[kGTListSectionControllerThreadKey];
    if (stack == nil) {
        stack = [NSMutableArray new];
        threadDictionary[kGTListSectionControllerThreadKey] = stack;
    }
    return stack;
}

void GTListSectionControllerPushThread(UIViewController *viewController, id<GTListCollectionContext> collectionContext) {
    GTListSectionControllerThreadContext *context = [GTListSectionControllerThreadContext new];
    context.viewController = viewController;
    context.collectionContext = collectionContext;
    
    [threadContextStack() addObject:context];
}

void GTListSectionControllerPopThread(void) {
    NSMutableArray *stack = threadContextStack();
    GTAssert(stack.count > 0, @"GTListSectionController thread stack is empty");
    [stack removeLastObject];
}

@implementation GTListSectionController

- (instancetype)init {
    if (self = [super init]) {
        GTListSectionControllerThreadContext *context = [threadContextStack() lastObject];
        _viewController = context.viewController;
        _collectionContext = context.collectionContext;
        
        if (_collectionContext == nil) {
            GTLKLog(@"Warning: Creating %@ outside of -[IGListAdapterDataSource listAdapter:sectionControllerForObject:]. Collection context and view controller will be set later.",
                    NSStringFromClass([self class]));
        }
        
        _minimumInteritemSpacing = 0.0;
        _minimumLineSpacing = 0.0;
        _inset = UIEdgeInsetsZero;
    }
    return self;
}

@end
