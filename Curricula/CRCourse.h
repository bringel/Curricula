//
//  CRCourse.h
//  Curricula
//
//  Created by Brad Ringel on 9/3/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRAssignment, CRSemester;

@interface CRCourse : NSManagedObject

@property (nonatomic, retain) NSString * courseName;
@property (nonatomic, retain) NSNumber * creditHours;
@property (nonatomic, retain) NSString * professorName;
@property (nonatomic, retain) NSOrderedSet *assignments;
@property (nonatomic, retain) CRSemester *semester;
@end

@interface CRCourse (CoreDataGeneratedAccessors)

- (void)insertObject:(CRAssignment *)value inAssignmentsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromAssignmentsAtIndex:(NSUInteger)idx;
- (void)insertAssignments:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeAssignmentsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInAssignmentsAtIndex:(NSUInteger)idx withObject:(CRAssignment *)value;
- (void)replaceAssignmentsAtIndexes:(NSIndexSet *)indexes withAssignments:(NSArray *)values;
- (void)addAssignmentsObject:(CRAssignment *)value;
- (void)removeAssignmentsObject:(CRAssignment *)value;
- (void)addAssignments:(NSOrderedSet *)values;
- (void)removeAssignments:(NSOrderedSet *)values;
@end
