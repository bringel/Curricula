//
//  CRSemester.h
//  Curricula
//
//  Created by Bradley Ringel on 9/11/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRCourse;

@interface CRSemester : NSManagedObject

@property (nonatomic, retain) NSNumber * currentSemester;
@property (nonatomic, retain) NSString * semesterName;
@property (nonatomic, retain) NSOrderedSet *courses;
@end

@interface CRSemester (CoreDataGeneratedAccessors)

- (void)insertObject:(CRCourse *)value inCoursesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromCoursesAtIndex:(NSUInteger)idx;
- (void)insertCourses:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeCoursesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInCoursesAtIndex:(NSUInteger)idx withObject:(CRCourse *)value;
- (void)replaceCoursesAtIndexes:(NSIndexSet *)indexes withCourses:(NSArray *)values;
- (void)addCoursesObject:(CRCourse *)value;
- (void)removeCoursesObject:(CRCourse *)value;
- (void)addCourses:(NSOrderedSet *)values;
- (void)removeCourses:(NSOrderedSet *)values;
@end
