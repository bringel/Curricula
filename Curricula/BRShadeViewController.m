//
//  BRShadeViewController.m
//  Curricula
//
//  Created by Brad Ringel on 8/4/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import "BRShadeViewController.h"
#import "CRSemesterCollectionViewController.h"
#import "CRCourseViewController.h"

@interface BRShadeViewController ()

@end

@implementation BRShadeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.shadeOpen = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationBar.delegate = self;
    if([[self.childViewControllers objectAtIndex:0] isKindOfClass:[CRSemesterCollectionViewController class]]){
        self.contentViewController = [self.childViewControllers objectAtIndex:0];
    }
    if([self.childViewControllers objectAtIndex:1]){
        self.shadeViewController = [self.childViewControllers objectAtIndex:1];
    }
    
    [[self.navigationBar.items lastObject] setTitle:self.contentViewController.title];
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar{
    if([bar isEqual:self.navigationBar]){
        return UIBarPositionTopAttached;
    }
    return UIBarPositionTop;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"embedContent"]){
        CRSemesterCollectionViewController *semesterVC = [segue destinationViewController];
        semesterVC.managedObjectContext = self.managedObjectContext;
        semesterVC.shadeViewController = self;
    }
    
}

- (IBAction)toggleShadeView:(id)sender {
    if(self.isShadeOpen){
        
    }
    else{
        [self.shadeViewController.view setFrame:CGRectMake(0, -200, 320, 200)];
        CGRect newFrame = CGRectMake(0, 64, 320, 200);
        [UIView animateWithDuration:1 animations:^{
            self.shadeViewController.view.frame = newFrame;
        }];
    }
}

- (void)changeToContentViewController:(UIViewController *)toViewController{
    
    CGRect savedFrame = self.contentViewController.view.frame;
    //this should be animating but it's not. No idea why
    [UIView animateWithDuration:1 animations:^{
        [self.contentViewController.view setAlpha:0];
    }];
    [self.contentViewController willMoveToParentViewController:nil];
    [self.contentViewController.view removeFromSuperview];
    [self.contentViewController removeFromParentViewController];
    
    [self addChildViewController:toViewController];
    [toViewController.view setFrame:savedFrame];
    [self.contentView addSubview:toViewController.view];
    [toViewController didMoveToParentViewController:self];
    
    if([toViewController isKindOfClass:[UINavigationController class]]){
        self.contentViewController = [(UINavigationController *)toViewController topViewController];
        [[self.navigationBar.items lastObject] setTitle: [(UINavigationController *)toViewController topViewController].title];
    }
    else{
        self.contentViewController = toViewController;
        [[self.navigationBar.items lastObject] setTitle: toViewController.title];
    }
    //[(CRCourseViewController *)[(UINavigationController *)toViewController topViewController] setShadeViewController:self];
}
@end
