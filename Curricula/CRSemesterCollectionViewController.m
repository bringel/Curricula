//
//  CRSemesterCollectionViewController.m
//  Curricula
//
//  Created by Brad Ringel on 8/19/13.
//  Copyright (c) 2013 Brad Ringel. All rights reserved.
//

#import "CRSemesterCollectionViewController.h"
#import "CRAddSemesterViewController.h"
#import "CRCourseCell.h"
#import "CRListCell.h"
#import "CRCourseViewController.h"

@interface CRSemesterCollectionViewController ()
//This is kinda hackish, but this is the best way to save
//the course we want to show.
@property (nonatomic, weak) CRCourse *selectedCourse;
@end

@implementation CRSemesterCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CRSemester" inManagedObjectContext:self.managedObjectContext];
    request.entity = entity;
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:request error:&error];
    
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newSemester:)];
//    [[self.shadeViewController.navigationBar.items lastObject] setRightBarButtonItem:addButton];
    
    self.semester = [fetchedObjects lastObject];
    self.title = self.semester.semesterName;
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if(self.semester == nil){
        [self performSegueWithIdentifier:@"addNewSemester" sender:self];
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newSemester:(id)sender{
    [self performSegueWithIdentifier:@"addNewSemester" sender:self];
}
//- (NSArray *)courses{
//    if(_courses == nil){
//        _courses = [self.semester.courses allObjects];
//    }
//    return _courses;
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"addNewSemester"]){
        CRAddSemesterViewController *addSemesterViewController = (CRAddSemesterViewController *)[(UINavigationController *)segue.destinationViewController topViewController];
        addSemesterViewController.managedObjectContext = self.managedObjectContext;
    }
    else if([segue.identifier isEqualToString:@"showCourse"]){
        CRCourseViewController *courseVC = [[segue destinationViewController] topViewController];
        courseVC.managedObjectContext = self.managedObjectContext;
        courseVC.shadeViewController = self.shadeViewController;
        courseVC.currentCourse = self.selectedCourse;
    }
}

- (IBAction)finishAddingSemester:(UIStoryboardSegue *)unwindSegue{
    CRAddSemesterViewController *source = (CRAddSemesterViewController *)unwindSegue.sourceViewController;
    self.semester = source.semester;
    self.title = self.semester.semesterName;
    //self.courses = [self.semester.courses allObjects];
    
}

- (IBAction)cancelAddingSemester:(UIStoryboardSegue *)unwindSegue{
    
}

#pragma mark - UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    int rows = self.semester.courses.count;
    
    double height = 44;
    return CGSizeMake(320, (rows *height));
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"listCell";
    CRListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.tableView.delegate = self;
    cell.tableView.dataSource = self;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectedCourse = [self.semester.courses objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showCourse" sender:self];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.semester.courses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"courseCell";
    CRCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.nameLabel.text = [[self.semester.courses objectAtIndex:indexPath.row] courseName];
    
    
    return cell;
}


@end
