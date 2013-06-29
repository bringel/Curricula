//
//  CRAddSemesterViewController.h
//  Curricula
//
//  Created by Brad Ringel on 6/20/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRAddCourseViewController.h"

@interface CRAddSemesterViewController : UITableViewController <UITextFieldDelegate, CRCourseAddingDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) NSMutableArray *semesterCourses;

- (IBAction)cancelAdding:(id)sender;
- (IBAction)doneAdding:(id)sender;

@end
