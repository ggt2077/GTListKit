//
//  GTListSectionType.h
//  GTListKit
//
//  Created by Tony on 17/6/7.
//  Copyright © 2017年 58. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GTListSectionType <NSObject>


/**
 Returns the number of items in the section.

 @return A count of items in the list.
 */
- (NSInteger)numberOfItems;

@end
