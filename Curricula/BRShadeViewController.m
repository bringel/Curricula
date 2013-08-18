//
//  BRShadeViewController.m
//  Curricula
//
//  Created by Brad Ringel on 8/4/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import "BRShadeViewController.h"
#import "CRSemesterViewController.h"

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
        CRSemesterViewController *semesterVC = (CRSemesterViewController *)segue.destinationViewController;
        semesterVC.managedObjectContext = self.managedObjectContext;
    }
    
}

- (IBAction)toggleShadeView:(id)sender {
    if(self.isShadeOpen){
        
    }
    else{
        NSLog(@"%@",self.view.subviews);
    }
}
@end
