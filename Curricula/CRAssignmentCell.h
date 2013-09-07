//
//  CRAssignmentCell.h
//  Curricula
//
//  Created by Brad Ringel on 8/19/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRGradeInputView.h"

@interface CRAssignmentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *assignmentNameLabel;

//@property (weak, nonatomic) IBOutlet CRGradeInputView *gradeInputView;

@property (weak, nonatomic) IBOutlet UITextField *inputLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;

@end
