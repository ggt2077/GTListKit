//
//  GTListCollectionView.m
//  GTListKit
//
//  Created by Tony on 17/6/5.
//  Copyright © 2017年 58. All rights reserved.
//

#import "GTListCollectionView.h"

@implementation GTListCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.backgroundColor = [UIColor whiteColor];
    self.alwaysBounceVertical = YES;
}

- (void)layoutSubviews {
    [UIView performWithoutAnimation:^{
        [super layoutSubviews];
    }];
}

@end
