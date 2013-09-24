//
//  CRMenuViewController.h
//  Curricula
//
//  Created by Brad Ringel on 8/20/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRSemester.h"
#import "BRShadeViewController.h"

@interface CRMenuViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) BRShadeViewController *shadeViewController;
@property (nonatomic, strong) CRSemester *semester;

- (NSInteger)heightForMenu;
@end
