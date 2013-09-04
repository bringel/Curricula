//
//  CRCourseViewController.m
//  Curricula
//
//  Created by Brad Ringel on 8/18/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import "CRCourseViewController.h"
#import "CRCourseSettingsViewController.h"
#import "CRAssignmentCell.h"

@interface CRCourseViewController () <UIAlertViewDelegate>
//@property (nonatomic, strong) NSArray *courseAssignments;
@end

@implementation CRCourseViewController

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
    self.title = self.currentCourse.courseName;
    NSLog(@"%@",self.currentCourse);
    if(self.currentCourse.assignments.count == 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Assignments" message:@"It looks like you don't have any assignments set up for this course. Let's add some" delegate:self cancelButtonTitle:@"Not right now thanks" otherButtonTitles: @"Okay, add assignments", nil];
        [alertView show];
    }
    
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStyleBordered target:self action:@selector(openSettings:)];
    [[self.shadeViewController.navigationBar.items lastObject] setRightBarButtonItem:settingsButton];
    
    //self.courseAssignments = [self.currentCourse.assignments allObjects];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CRCourse *)currentCourse{
    if(_currentCourse == nil){
        //We're probably testing something now, so just make a fake one for us to use
        CRCourse *testCourse = [NSEntityDescription insertNewObjectForEntityForName:@"CRCourse" inManagedObjectContext:self.managedObjectContext];
        testCourse.courseName = @"TARDIS Repair";
        testCourse.professorName = @"The Doctor";
        testCourse.creditHours = @(1);
        _currentCourse = testCourse;
    }
    return _currentCourse;
}

- (void)openSettings:(id)sender{
    [self performSegueWithIdentifier:@"showSettings" sender:self];
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
    return self.currentCourse.assignments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"assignmentCell";
    CRAssignmentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.assignmentNameLabel.text = [[self.currentCourse.assignments objectAtIndex:indexPath.row] name];
    
    return cell;
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
    if([segue.identifier isEqualToString:@"showSettings"]){
        [(CRCourseSettingsViewController *)[segue.destinationViewController topViewController] setManagedObjectContext:self.managedObjectContext];
        [(CRCourseSettingsViewController *)[segue.destinationViewController topViewController] setCurrentCourse:self.currentCourse];
    }
}



#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //Push the view controller to add assignments.
    if(buttonIndex == 1){
        [self performSegueWithIdentifier:@"showSettings" sender:self];
    }
}

@end
