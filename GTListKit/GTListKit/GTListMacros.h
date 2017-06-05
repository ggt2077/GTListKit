//
//  GTListMacros.h
//  GTListKit
//
//  Created by Tony on 17/6/5.
//  Copyright © 2017年 58. All rights reserved.
//

#ifndef GTLK_SUBCLASSING_RESTRICTED
#if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#define GTLK_SUBCLASSING_RESTRICTED __attribute__((objc_subclassing_restricted))
#else
#define GTLK_SUBCLASSING_RESTRICTED
#endif
#endif

#ifndef GTLK_UNAVAILABLE
#define GTLK_UNAVAILABLE(message) __attribute__((unavailable(message)))
#endif
