//
//  CRAssignmentCategory.h
//  Curricula
//
//  Created by Bradley Ringel on 9/11/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRAssignment, CRCourse;

@interface CRAssignmentCategory : NSManagedObject

@property (nonatomic, retain) NSString * categoryName;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSNumber * repeat;
@property (nonatomic, retain) NSNumber * repeatCount;
@property (nonatomic, retain) NSNumber * unlimitedRepeat;
@property (nonatomic, retain) CRCourse *course;
@property (nonatomic, retain) NSOrderedSet *assignments;
@end

@interface CRAssignmentCategory (CoreDataGeneratedAccessors)

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
