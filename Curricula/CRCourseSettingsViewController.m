//
//  CRCourseSettingsViewController.m
//  Curricula
//
//  Created by Brad Ringel on 8/31/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import "CRCourseSettingsViewController.h"
#import "CRAddAssignmentViewController.h"
#import "CRAssignment.h"
#import "CRButtonCell.h"

@interface CRCourseSettingsViewController ()

@end

@implementation CRCourseSettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addAssignment:(UIStoryboardSegue *)unwindSegue{
    CRAssignmentCategory *newCategory = [unwindSegue.sourceViewController category];
    
    if([newCategory.repeat boolValue]){
        
        if([newCategory.unlimitedRepeat boolValue]){
            //The logic here will really be dealt with when an assignment gets a grade added
            //then we have to make sure to make a new one and insert it in the proper place.
            CRAssignment *newAssignment = [NSEntityDescription insertNewObjectForEntityForName:@"CRAssignment" inManagedObjectContext:self.managedObjectContext];
            newAssignment.name = [NSString stringWithFormat:@"%@ %d", newCategory.categoryName, 1];
            newAssignment.category = newCategory;
            
            NSError *error;
            [self.managedObjectContext save:&error];
        }
        else{
            NSOperationQueue *assignmentQueue = [NSOperationQueue mainQueue];
            [assignmentQueue addOperation:[NSBlockOperation blockOperationWithBlock:^(){
                int count = [newCategory.repeatCount intValue];
                for(int i = 0; i < count; i++){
                    CRAssignment *assignment = [NSEntityDescription insertNewObjectForEntityForName:@"CRAssignment" inManagedObjectContext:self.managedObjectContext];
                    assignment.name = [NSString stringWithFormat:@"%@ %d", newCategory.categoryName, i+1];
                    //assignment.pointsOutOf = [assignmentDescription objectForKey:@"points"];
                    assignment.category = newCategory;
                    
                    NSError *error;
                    [self.managedObjectContext save:&error];
                }
            }]];
        }
    }
    else{
        CRAssignment *newAssignment = [NSEntityDescription insertNewObjectForEntityForName:@"CRAssignment" inManagedObjectContext:self.managedObjectContext];
        
        newAssignment.name = newCategory.categoryName;
        
        newAssignment.category = newCategory;
        newCategory.course = self.currentCourse;
        //add the current course here too.
        NSError *error;
        [self.managedObjectContext save:&error];
        
        
    }
    newCategory.course = self.currentCourse;
    NSError *error;
    [self.managedObjectContext save:&error];
    
    //Don't forget to set the relationship on the new category before doing this, or nothing will happen.
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.currentCourse.categories.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == self.currentCourse.categories.count){
        CRButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"buttonCell" forIndexPath:indexPath];
        return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
        cell.textLabel.text = [[self.currentCourse.categories objectAtIndex:indexPath.row] categoryName];
        
        return cell;
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"addAssignment"]){
        [segue.destinationViewController setManagedObjectContext:self.managedObjectContext];
    }
}


@end
