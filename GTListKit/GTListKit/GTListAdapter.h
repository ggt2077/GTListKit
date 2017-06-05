//
//  GTListAdapter.h
//  GTListKit
//
//  Created by Tony on 17/6/5.
//  Copyright © 2017年 58. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTListMacros.h"

GTLK_SUBCLASSING_RESTRICTED
@interface GTListAdapter : NSObject

/**
 初始构造器

 @param viewController 控制器
 @return 实例对象
 */
- (instancetype)initWithUpdater:updatingDelegate
                 viewController:(nullable UIViewController *)viewController
               workingRangeSize:(NSInteger)workingRangeSize NS_DESIGNATED_INITIALIZER;

@end
