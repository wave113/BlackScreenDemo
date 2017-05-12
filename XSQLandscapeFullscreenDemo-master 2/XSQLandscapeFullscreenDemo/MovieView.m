//
//  MovieView.m
//  LandscapeFullscreenDemo
//
//  Created by  on 17/1/23.
//  Copyright © 2017年 . All rights reserved.
//

#import "MovieView.h"

@implementation MovieView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.image = [UIImage imageNamed:@"mountain.jpg"];
    }
    return self;
}

@end
