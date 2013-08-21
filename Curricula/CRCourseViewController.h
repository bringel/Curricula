//
//  CRCourseViewController.h
//  Curricula
//
//  Created by Brad Ringel on 8/18/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRSemester.h"
#import "CRCourse.h"
#import "BRShadeViewController.h"

@interface CRCourseViewController : UITableViewController

@property (nonatomic, weak) BRShadeViewController *shadeViewController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) CRCourse *currentCourse;

@end
