//
//  CRCourseSettingsViewController.h
//  Curricula
//
//  Created by Brad Ringel on 8/31/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRCourse.h"

@interface CRCourseSettingsViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray *categories;

@property (nonatomic, strong) CRCourse *currentCourse;

- (IBAction)addAssignment:(UIStoryboardSegue *)unwindSegue;

@end
