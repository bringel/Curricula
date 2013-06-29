//
//  CREntryCell.h
//  Curricula
//
//  Created by Brad Ringel on 6/20/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CREntryCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *textLabel;
@property (nonatomic, weak) IBOutlet UITextField *inputField;

@end
