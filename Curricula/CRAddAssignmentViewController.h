//
//  CRAddAssignmentViewController.h
//  Curricula
//
//  Created by Brad Ringel on 8/29/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRAddAssignmentViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *categoryNameField;
@property (weak, nonatomic) IBOutlet UITextField *pointsField;
@property (weak, nonatomic) IBOutlet UISwitch *repeatSwitch;

@end
