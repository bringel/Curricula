//
//  CRAssignment.h
//  Curricula
//
//  Created by Bradley Ringel on 9/11/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRAssignmentCategory;

@interface CRAssignment : NSManagedObject

@property (nonatomic, retain) NSNumber * extraCredit;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * points;
@property (nonatomic, retain) NSNumber * pointsOutOf;
@property (nonatomic, retain) CRAssignmentCategory *category;

@end
