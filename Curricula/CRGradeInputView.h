//
//  CRGradeInputView.h
//  Curricula
//
//  Created by Brad Ringel on 8/31/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRGradeInputView : UIView


@property (weak, nonatomic) IBOutlet UITextField *inputField;

@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;

@property (weak, nonatomic) IBOutlet UIImageView *targetImage;

@end
