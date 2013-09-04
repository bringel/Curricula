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

- (NSArray *)categories{
    if(_categories == nil){
        _categories = [[NSArray alloc] init];
    }
    
    return _categories;
}

- (IBAction)addAssignment:(UIStoryboardSegue *)unwindSegue{
    NSDictionary *assignmentDescription = [(CRAddAssignmentViewController *)unwindSegue.sourceViewController descriptionDictionary];
    if([[assignmentDescription objectForKey:@"repeat"] boolValue]){
        
    }
    else{
        CRAssignment *newAssignment = [NSEntityDescription insertNewObjectForEntityForName:@"CRAssignment" inManagedObjectContext:self.managedObjectContext];
        newAssignment.name = [assignmentDescription objectForKey:@"name"];
        newAssignment.pointsOutOf = [assignmentDescription objectForKey:@"points"];
        //[self.currentCourse addAssignmentsObject:newAssignment];
        newAssignment.course = self.currentCourse;
        //add the current course here too.
        NSError *error;
        [self.managedObjectContext save:&error];
        NSMutableArray *mutalbeCategories = [self.categories mutableCopy];
        [mutalbeCategories addObject:[assignmentDescription objectForKey:@"name"]];
        self.categories = [mutalbeCategories copy];
        
    }
    
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
    return self.categories.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == self.categories.count){
        CRButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"buttonCell" forIndexPath:indexPath];
        return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
        cell.textLabel.text = [self.categories objectAtIndex:indexPath.row];
        
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

/*
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
*/

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
