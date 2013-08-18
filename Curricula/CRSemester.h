//
//  CRSemester.h
//  Curricula
//
//  Created by Brad Ringel on 8/18/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRCourse;

@interface CRSemester : NSManagedObject

@property (nonatomic, retain) NSString * semesterName;
@property (nonatomic, retain) NSSet *courses;
@end

@interface CRSemester (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(CRCourse *)value;
- (void)removeCoursesObject:(CRCourse *)value;
- (void)addCourses:(NSSet *)values;
- (void)removeCourses:(NSSet *)values;

@end
