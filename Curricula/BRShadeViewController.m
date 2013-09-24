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
#import "CRMenuViewController.h"

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
    if([[self.childViewControllers objectAtIndex:1] isKindOfClass:[CRMenuViewController class]]){
        
        self.shadeViewController = [self.childViewControllers objectAtIndex:1];
    }
    
    [[self.navigationBar.items lastObject] setTitle:self.contentViewController.title];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0/255.0f green:34/255.0f blue:89/255.0f alpha:1.0f]];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
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
    else if([segue.identifier isEqualToString:@"embedShade"]){
        CRMenuViewController *menuViewcontroller = [segue destinationViewController];
        menuViewcontroller.managedObjectContext = self.managedObjectContext;
        menuViewcontroller.shadeViewController = self;
    }
    
}

- (IBAction)toggleShadeView:(id)sender {
    NSInteger height = [(CRMenuViewController *)self.shadeViewController heightForMenu];

    if(self.shadeOpen){
        CGRect newFrame = CGRectMake(0,-1 * height,320,0);
        [UIView animateWithDuration:0.2 animations:^{
            self.shadeViewController.view.frame = newFrame;
        }];
        [self.contentView setUserInteractionEnabled:YES];
        [self.shadeView setUserInteractionEnabled:NO];
        self.shadeOpen = NO;
    }
    else{
        [self.shadeViewController.view setFrame:CGRectMake(0, -1 *height, 320, height)];
        CGRect newFrame = CGRectMake(0, 64, 320, height);
        [UIView animateWithDuration:0.2 animations:^{
            self.shadeViewController.view.frame = newFrame;
        }];
        [self.contentView setUserInteractionEnabled:NO];
        [self.shadeView setUserInteractionEnabled:YES];
        self.shadeOpen = YES;
//        [[(CRMenuViewController *)self.shadeViewController tableView] reloadData];
    }
    [self.shadeView.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.shadeView.layer setBorderWidth:3];
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
