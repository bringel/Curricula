//
//  CRMasterViewController.h
//  Curricula
//
//  Created by Brad Ringel on 6/20/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRDetailViewController;

#import <CoreData/CoreData.h>

@interface CRMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) CRDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
