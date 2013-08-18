//
//  CRAddSemesterViewController.h
//  Curricula
//
//  Created by Brad Ringel on 6/20/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRSemester.h"

@interface CRAddSemesterViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) NSMutableArray *semesterCourses;
@property (weak, nonatomic) IBOutlet UITextField *semesterNameField;
@property (nonatomic, strong) CRSemester *semester;

- (IBAction)addCourseWithUnwindSegue:(UIStoryboardSegue *)segue;    


@end
