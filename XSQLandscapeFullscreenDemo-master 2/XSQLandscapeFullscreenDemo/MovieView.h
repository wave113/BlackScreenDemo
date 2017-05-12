//
//  MovieView.h
//  LandscapeFullscreenDemo
//
//  Created by  on 17/1/23.
//  Copyright © 2017年 . All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MovieViewState) {
    MovieViewStateSmall,
    MovieViewStateAnimating,
    MovieViewStateFullscreen,
};

@interface MovieView : UIImageView

/**
 记录小屏时的parentView
 */
@property (nonatomic, weak) UIView *movieViewParentView;

/**
 记录小屏时的frame
 */
@property (nonatomic, assign) CGRect movieViewFrame;

@property (nonatomic, assign) MovieViewState state;

@end
