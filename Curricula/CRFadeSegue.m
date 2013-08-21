//
//  CRFadeSegue.m
//  Curricula
//
//  Created by Brad Ringel on 8/20/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import "CRFadeSegue.h"
#import "BRShadeViewController.h"
#import "CRSemesterCollectionViewController.h"
#import "CRCourseViewController.h"

@implementation CRFadeSegue

- (void)perform{
    BRShadeViewController *shadeVC = [self.sourceViewController shadeViewController];
    
//    CATransition *transition = [[CATransition alloc] init];
//    transition.duration = 0.3;
//    transition.type = kCATransitionFade;
//    
//    [[[self.sourceViewController view] layer] addAnimation:transition forKey:kCATransitionFade];
//    [UIView animateWithDuration:1 animations:^{
//        [[self.sourceViewController view] setAlpha:0];
//    }];
//    CGRect frame = [self.sourceViewController view].frame;
//    [self.sourceViewController willMoveToParentViewController:nil];
//    [[self.sourceViewController view] removeFromSuperview];
//    [self.sourceViewController removeFromParentViewController];
//    
//    [shadeVC addChildViewController:self.destinationViewController];
//    [self.destinationViewController view].frame = frame;
//    [shadeVC.view addSubview:[self.destinationViewController view]];
//    [self.destinationViewController didMoveToParentViewController:shadeVC];
    
    [shadeVC changeToContentViewController:self.destinationViewController];
}

@end
