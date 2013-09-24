//
//  CRAddAssignmentViewController.h
//  Curricula
//
//  Created by Brad Ringel on 8/29/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRAssignmentCategory.h"

@interface CRAddAssignmentViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) CRAssignmentCategory *category;

@property (weak, nonatomic) IBOutlet UITextField *categoryNameField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UISwitch *repeatSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *unlimitedSwitch;
@property (weak, nonatomic) IBOutlet UITextField *repeatsField;

@end
