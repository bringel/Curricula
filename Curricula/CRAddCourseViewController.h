//
//  CRAddCourseViewController.h
//  Curricula
//
//  Created by Brad Ringel on 8/15/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRCourse.h"


@interface CRAddCourseViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UITextField *courseNameField;
@property (weak, nonatomic) IBOutlet UITextField *professorNameField;
@property (weak, nonatomic) IBOutlet UITextField *creditHoursField;

@property (nonatomic, weak) CRCourse *course;
- (IBAction)cancelAddingCourse:(id)sender;

@end
