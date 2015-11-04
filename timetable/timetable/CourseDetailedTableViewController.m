//
//  CourseDetailedTableViewController.m
//  timetable
//
//  Created by Matthew Blurton on 5/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "CourseDetailedTableViewController.h"

@interface CourseDetailedTableViewController ()

@end

@implementation CourseDetailedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /*@property (nonatomic,strong) NSArray *dataArray;
    @property (nonatomic,strong) NSArray *dataArrayunit;
    @property (nonatomic,strong) NSArray *dataArraystudent;
    @property (nonatomic,strong) NSArray *dataArraylecurer;
    @property (nonatomic,strong) NSArray *dataArraycourse;
    @property (nonatomic,strong) NSArray *dataArrayroom;*/
    
    self.dataArray = [[NSArray alloc] init];
    self.dataArrayunit = [[NSArray alloc] init];
    self.dataArraystudent = [[NSArray alloc] init];
    self.dataArraylecturer = [[NSArray alloc] init];
    self.dataArrayroom = [[NSArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self retrieveFromParse];
}

- (void) retrieveFromParse {
    PFQuery *TimeTableQuery = [PFQuery queryWithClassName:@"TimeTable"];
    
    // Checks if both classFromFilter and objectFromFilter has data to determine whether to add a filter to the timetable or not
    if (self.stringKeyFilter && self.objectValueFilter) {
        [TimeTableQuery whereKey:self.stringKeyFilter equalTo:self.objectValueFilter];
    }
    
    [TimeTableQuery includeKey:@"Unit_id"];
    [TimeTableQuery includeKey:@"Student_id"];
    [TimeTableQuery includeKey:@"Lecturer_id"];
    [TimeTableQuery includeKey:@"Room_id"];
    [TimeTableQuery findObjectsInBackgroundWithBlock:^(NSArray *TimeTableObject, NSError * error) {
        if (!error) {
            self.dataArrayunit = [TimeTableObject valueForKey:@"Unit_id"];
            self.dataArraystudent = [TimeTableObject valueForKey:@"Student_id"];
            self.dataArraylecturer = [TimeTableObject valueForKey:@"Lecturer_id"];
            self.dataArrayroom = [TimeTableObject valueForKey:@"Room_id"];
            
            self.dataArray = TimeTableObject;
            
            [self.detailedTableView reloadData];
        } else {
            NSLog(@"Error Occurred: %@", [error description]);
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *unit = [self.dataArrayunit objectAtIndex:indexPath.row];
    PFObject *room = [self.dataArrayroom objectAtIndex:indexPath.row];
    PFObject *students = [self.dataArraystudent objectAtIndex:indexPath.row];
    PFObject *lecturers = [self.dataArraylecturer objectAtIndex:indexPath.row];
    PFObject *timetable = [self.dataArray objectAtIndex:indexPath.row];
    
    [cell setObject:unit :lecturers :room :timetable: students];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
