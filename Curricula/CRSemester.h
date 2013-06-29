//
//  CRSemester.h
//  Curricula
//
//  Created by Brad Ringel on 6/28/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CRSemester : NSManagedObject

@property (nonatomic, retain) NSString * semesterName;
@property (nonatomic, retain) NSSet *courses;
@end

@interface CRSemester (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(NSManagedObject *)value;
- (void)removeCoursesObject:(NSManagedObject *)value;
- (void)addCourses:(NSSet *)values;
- (void)removeCourses:(NSSet *)values;

@end
