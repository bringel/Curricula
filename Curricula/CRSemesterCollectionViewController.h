//
//  CRSemesterCollectionViewController.h
//  Curricula
//
//  Created by Brad Ringel on 8/19/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRSemester.h"
#import "CRCourse.h"
#import "BRShadeViewController.h"

@interface CRSemesterCollectionViewController : UICollectionViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) CRSemester *semester;
@property (nonatomic, strong) NSArray *courses;

@property (nonatomic, weak) IBOutlet BRShadeViewController *shadeViewController;

- (IBAction)finishAddingSemester:(UIStoryboardSegue *)unwindSegue;
- (IBAction)cancelAddingSemester:(UIStoryboardSegue *)unwindSegue;

@end
