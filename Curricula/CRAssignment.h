//
//  CRAssignment.h
//  Curricula
//
//  Created by Brad Ringel on 8/18/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRCourse;

@interface CRAssignment : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSNumber * points;
@property (nonatomic, retain) NSNumber * pointsOutOf;
@property (nonatomic, retain) NSNumber * extraCredit;
@property (nonatomic, retain) CRCourse *course;

@end
