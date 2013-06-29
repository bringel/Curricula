//
//  CRAddCourseViewController.h
//  Curricula
//
//  Created by Brad Ringel on 6/28/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRCourse.h"

@protocol CRCourseAddingDelegate <NSObject>

- (void)didAddCourse:(CRCourse *)newCourse;

@end

@interface CRAddCourseViewController : UITableViewController

- (IBAction)cancelAdding:(id)sender;
- (IBAction)doneAdding:(id)sender;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, weak) id<CRCourseAddingDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *courseNameField;
@property (weak, nonatomic) IBOutlet UITextField *professorNameField;
@property (weak, nonatomic) IBOutlet UITextField *creditHoursField;
@end
