//
//  CRAddSemesterViewController.m
//  Curricula
//
//  Created by Brad Ringel on 6/20/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import "CRAddSemesterViewController.h"
#import "CRSemester.h"
#import "CREntryCell.h"
#import "CRButtonCell.h"
#import "CRAddCourseViewController.h"

@interface CRAddSemesterViewController ()

@property (nonatomic, strong) NSString *semesterName;

@end

@implementation CRAddSemesterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"New Semester";
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

- (NSMutableArray *)semesterCourses{
    if(_semesterCourses == nil){
        _semesterCourses = [[NSMutableArray alloc] init];
    }
    return _semesterCourses;
}

- (IBAction)cancelAdding:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneAdding:(id)sender{
    CRSemester *newSemester = [NSEntityDescription insertNewObjectForEntityForName:@"CRSemester" inManagedObjectContext:self.managedObjectContext];
    
    
    NSError *error = nil;
    [self.managedObjectContext save:&error];
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
    return self.semesterCourses.count + 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier;
    if(indexPath.row == 0){
        cellIdentifier = @"entryCell";
    }
    else if(indexPath.row == self.semesterCourses.count + 1){
        cellIdentifier = @"buttonCell";
    }
    else{
        cellIdentifier = @"courseCell";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if(indexPath.row == 0){
        ((CREntryCell*)cell).textLabel.text = @"Semester Name:";
    }
    if(indexPath.row == self.semesterCourses.count + 1){
        ((CRButtonCell *)cell).buttonLabel.text = @"Add a New Course";
        [((CRButtonCell *)cell).buttonLabel setTextColor:self.view.tintColor];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == self.semesterCourses.count + 1){
        NSLog(@"Add a new Course to the semester");
        [self performSegueWithIdentifier:@"addNewCourse" sender:self];
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

- (void)didAddCourse:(CRCourse *)newCourse{
    [self.semesterCourses addObject:newCourse];
    [self.tableView reloadData];
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"%@", segue.destinationViewController);
    CRAddCourseViewController *addCourseViewController = [segue.destinationViewController topViewController];
    addCourseViewController.managedObjectContext = self.managedObjectContext;
    addCourseViewController.delegate = self;
}



#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.semesterName = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
}

@end
