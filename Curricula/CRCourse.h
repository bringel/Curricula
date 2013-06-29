//
//  CRCourse.h
//  Curricula
//
//  Created by Brad Ringel on 6/28/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRSemester;

@interface CRCourse : NSManagedObject

@property (nonatomic, retain) NSString * courseName;
@property (nonatomic, retain) NSString * professorName;
@property (nonatomic, retain) NSNumber * creditHours;
@property (nonatomic, retain) CRSemester *semester;

@end
