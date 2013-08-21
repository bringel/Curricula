//
//  BRShadeViewController.h
//
//  Created by Brad Ringel on 8/4/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 This is a containter view controller that brings a menu
 down from the navigation bar over the current view controller.
 */

@interface BRShadeViewController : UIViewController <UINavigationBarDelegate>

@property (nonatomic, strong) UIViewController *shadeViewController;
@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, getter = isShadeOpen) BOOL shadeOpen;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

- (IBAction)toggleShadeView:(id)sender;
@end
