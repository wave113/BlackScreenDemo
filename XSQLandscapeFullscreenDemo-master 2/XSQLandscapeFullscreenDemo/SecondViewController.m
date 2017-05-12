//
//  SecondViewController.m
//  LandscapeFullscreenDemo
//
//  Created by  on 17/1/23.
//  Copyright © 2017年 . All rights reserved.
//

#import "SecondViewController.h"
#import "FullscreenViewController.h"
#import "MovieView.h"

@interface SecondViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) MovieView *movieView;
@property (nonatomic, weak) FullscreenViewController *fullscreenViewController;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieView = [[MovieView alloc] init];
    self.movieView.userInteractionEnabled = YES;
    self.movieView.frame = CGRectMake(0, 100, 320, 180);
    [self.view addSubview:self.movieView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.movieView addGestureRecognizer:tapGestureRecognizer];
    
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        if (self.movieView.state == MovieViewStateSmall) {
            [self enterFullscreen];
        }
        else if (self.movieView.state == MovieViewStateFullscreen) {
            [self exitFullscreen];
        }
    }
}

- (void)enterFullscreen {
    
    if (self.movieView.state != MovieViewStateSmall) {
        return;
    }
    
    self.movieView.state = MovieViewStateAnimating;
    
    self.movieView.movieViewFrame = self.movieView.frame;
    self.movieView.movieViewParentView = self.movieView.superview;
    
    FullscreenViewController *fullscreenViewController = [[FullscreenViewController alloc] init];
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        fullscreenViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    else {
        fullscreenViewController.modalPresentationStyle = UIModalPresentationCustom;
    }
    fullscreenViewController.modalPresentationCapturesStatusBarAppearance = true;
    [self presentViewController:fullscreenViewController animated:YES completion:^{
        self.movieView.state = MovieViewStateFullscreen;
        [fullscreenViewController.view addSubview:self.movieView];
    }];
    self.fullscreenViewController = fullscreenViewController;
}

- (void)exitFullscreen {
    
    if (self.movieView.state != MovieViewStateFullscreen) {
        return;
    }
    
    self.movieView.state = MovieViewStateAnimating;
    [self.fullscreenViewController dismissViewControllerAnimated:YES completion:^{
        [self.view addSubview:self.movieView];
        self.movieView.state = MovieViewStateSmall;
    }];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
@end
