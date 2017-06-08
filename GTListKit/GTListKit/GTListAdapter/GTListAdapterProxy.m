//
//  GTListAdapterProxy.m
//  GTListKit
//
//  Created by Tony on 17/6/6.
//  Copyright © 2017年 58. All rights reserved.
//

#import "GTListAdapterProxy.h"
#import "GTListAssert.h"
#import "GTListAdapter.h"

static BOOL isInterceptedSelector(SEL sel) {
    return (
            // UICollectionViewDelegate
            sel == @selector(collectionView:didSelectItemAtIndexPath:) ||
            sel == @selector(collectionView:willDisplayCell:forItemAtIndexPath:) ||
            sel == @selector(collectionView:didEndDisplayingCell:forItemAtIndexPath:) ||
            // UICollectionViewDelegateFlowLayout
            sel == @selector(collectionView:layout:sizeForItemAtIndexPath:) ||
            sel == @selector(collectionView:layout:insetForSectionAtIndex:) ||
            sel == @selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:) ||
            sel == @selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:) ||
            sel == @selector(collectionView:layout:referenceSizeForFooterInSection:) ||
            sel == @selector(collectionView:layout:referenceSizeForHeaderInSection:) ||
            // UIScrollViewDelegate
            sel == @selector(scrollViewDidScroll:) ||
            sel == @selector(scrollViewWillBeginDragging:) ||
            sel == @selector(scrollViewDidEndDragging:willDecelerate:)
            );
}

@interface GTListAdapterProxy () {
    __weak id _collectionViewTarget;
    __weak id _scrollViewTarget;
    __weak GTListAdapter *_interceptor;
}

@end

@implementation GTListAdapterProxy

- (instancetype)initWithCollectionViewTarget:(nullable id<UICollectionViewDelegate>)collectionViewTarget
                            scrollViewTarget:(nullable id<UIScrollViewDelegate>)scrollViewTarget
                                 interceptor:(GTListAdapter *)interceptor{
    GTParameterAssert(interceptor != nil);
    // -[NSProxy init] is undefined
    if (self) {
        _collectionViewTarget = collectionViewTarget;
        _scrollViewTarget = scrollViewTarget;
        _interceptor = interceptor;
    }
    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return isInterceptedSelector(aSelector)
    || [_collectionViewTarget respondsToSelector:aSelector]
    || [_scrollViewTarget respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (isInterceptedSelector(aSelector)) {
        return _interceptor;
    }
    
    // since UICollectionViewDelegate is a superset of UIScrollViewDelegate, first check if the method exists in
    // _scrollViewTarget, otherwise use the _collectionViewTarget
    return [_scrollViewTarget respondsToSelector:aSelector] ? _scrollViewTarget : _collectionViewTarget;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    void *nullPointer = NULL;
    [invocation setReturnValue:&nullPointer];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

@end
