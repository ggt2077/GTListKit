//
//  GTListAssert.h
//  GTListKit
//
//  Created by Tony on 17/6/6.
//  Copyright © 2017年 58. All rights reserved.
//

#ifndef GTAssert
#define GTAssert( condition, ... ) NSCAssert( (condition) , ##__VA_ARGS__)
#endif // GTAssert

#ifndef GTParameterAssert
#define GTParameterAssert( condition ) GTAssert( (condition) , @"Invalid parameter not satisfying: %@", @#condition)
#endif // GTParameterAssert

#ifndef GTAssertMainThread
#define GTAssertMainThread() GTAssert( ([NSThread isMainThread] == YES), @"Must be on the main thread")
#endif // GTAssertMainThread
