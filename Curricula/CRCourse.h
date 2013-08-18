//
//  CRCourse.h
//  Curricula
//
//  Created by Brad Ringel on 8/18/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRAssignment, CRSemester;

@interface CRCourse : NSManagedObject

@property (nonatomic, retain) NSString * courseName;
@property (nonatomic, retain) NSNumber * creditHours;
@property (nonatomic, retain) NSString * professorName;
@property (nonatomic, retain) CRSemester *semester;
@property (nonatomic, retain) NSSet *assignments;
@end

@interface CRCourse (CoreDataGeneratedAccessors)

- (void)addAssignmentsObject:(CRAssignment *)value;
- (void)removeAssignmentsObject:(CRAssignment *)value;
- (void)addAssignments:(NSSet *)values;
- (void)removeAssignments:(NSSet *)values;

@end
