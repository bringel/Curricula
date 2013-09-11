//
//  CRCourse.h
//  Curricula
//
//  Created by Bradley Ringel on 9/11/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRAssignmentCategory, CRSemester;

@interface CRCourse : NSManagedObject

@property (nonatomic, retain) NSString * courseName;
@property (nonatomic, retain) NSNumber * creditHours;
@property (nonatomic, retain) NSString * professorName;
@property (nonatomic, retain) CRSemester *semester;
@property (nonatomic, retain) NSOrderedSet *categories;
@end

@interface CRCourse (CoreDataGeneratedAccessors)

- (void)insertObject:(CRAssignmentCategory *)value inCategoriesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromCategoriesAtIndex:(NSUInteger)idx;
- (void)insertCategories:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeCategoriesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInCategoriesAtIndex:(NSUInteger)idx withObject:(CRAssignmentCategory *)value;
- (void)replaceCategoriesAtIndexes:(NSIndexSet *)indexes withCategories:(NSArray *)values;
- (void)addCategoriesObject:(CRAssignmentCategory *)value;
- (void)removeCategoriesObject:(CRAssignmentCategory *)value;
- (void)addCategories:(NSOrderedSet *)values;
- (void)removeCategories:(NSOrderedSet *)values;
@end
