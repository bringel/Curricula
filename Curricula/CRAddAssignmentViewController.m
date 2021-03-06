//
//  CRAddAssignmentViewController.m
//  Curricula
//
//  Created by Brad Ringel on 8/29/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import "CRAddAssignmentViewController.h"

@interface CRAddAssignmentViewController ()

@end

@implementation CRAddAssignmentViewController

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
    [self.repeatSwitch addTarget:self action:@selector(repeatToggled:) forControlEvents:UIControlEventValueChanged];
    [self.unlimitedSwitch addTarget:self action:@selector(unlimitedRepeats:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//TODO:Add some animations here
- (void)repeatToggled:(id)sender{
    if([self.repeatSwitch isOn]){
        //Show the extra rows
        [[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]] setHidden:NO];
        if(![self.unlimitedSwitch isOn]){
            [[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]] setHidden:NO];
        }
    }
    else{
        //hide the rows
        [[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]] setHidden:YES];
        [[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]] setHidden:YES];
    }
}

- (void)unlimitedRepeats:(id)sender{
    if([self.unlimitedSwitch isOn]){
        //hide the last row
        [[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]] setHidden:YES];
    }
    else{
        [[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]] setHidden:NO];
    }
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //if([segue.identifier isEqualToString:@"addAssignment"]){
        
    //}
    
    CRAssignmentCategory *category = [NSEntityDescription insertNewObjectForEntityForName:@"CRAssignmentCategory" inManagedObjectContext:self.managedObjectContext];
    category.categoryName = self.categoryNameField.text;
    category.weight = @(self.weightField.text.doubleValue);
    category.repeat = @(self.repeatSwitch.on);
    category.unlimitedRepeat = @(self.unlimitedSwitch.on);
    category.repeatCount = @(self.repeatsField.text.integerValue);
    
    NSError *error;
    [self.managedObjectContext save:&error];
    
    self.category = category;
}



@end
