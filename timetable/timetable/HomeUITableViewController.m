//
//  HomeUITableViewController.m
//  timetable
//
//  Created by Matthew Blurton on 29/10/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "HomeUITableViewController.h"
#import "CustomCell.h"

@interface HomeUITableViewController ()

@end

@implementation HomeUITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.dataArrayunit = [[NSArray alloc] init];
    self.dataArraystudent = [[NSArray alloc] init];
    self.dataArraylecurer = [[NSArray alloc] init];
    self.dataArrayroom = [[NSArray alloc] init];
    self.dataArraycourse = [[NSArray alloc] init];
    self.dataArray = [[NSArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    NSLog(@"I will appear!!");
    [self retrieveFromParse];
}

- (void) retrieveFromParse {

    
    PFQuery * TimeTablequery = [PFQuery queryWithClassName:@"TimeTable"];
    
    [TimeTablequery includeKey:@"Unit_id"];
    [TimeTablequery includeKey:@"Student_id"];
    [TimeTablequery includeKey:@"Room_id"];
    [TimeTablequery findObjectsInBackgroundWithBlock:^(NSArray *TimeTableObject, NSError *error)
     
     {
         if(!error){
             
             NSLog(@"Successfully retrieved %lu TimeTable", (unsigned long)TimeTableObject.count);
             
             
             //Assign each PFObject to individual NSARRY from the query that will be sent to custom cell
             self.dataArrayunit = [TimeTableObject valueForKey:@"Unit_id"];
             self.dataArraystudent = [TimeTableObject valueForKey:@"Student_id"];
             self.dataArrayroom = [TimeTableObject valueForKey:@"Room_id"];
             
             //This gets the combined values from the table for Day and time
             self.dataArray = TimeTableObject;
             
             [self.datatable reloadData];
         }
         NSLog(@"%@",TimeTableObject);
         
         
        
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
    // setup cell
    static NSString *CellIdentifier = @"Custom Cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    //PFObject for each value that needs to be sent to CustomCell
    
    PFObject *unitObject = [self.dataArrayunit objectAtIndex:indexPath.row];
    
    PFObject *roomObject = [self.dataArrayroom objectAtIndex:indexPath.row];
    
    PFObject *studentObject = [self.dataArraystudent objectAtIndex:indexPath.row];

    PFObject *dayTimeObject = [self.dataArray objectAtIndex:indexPath.row];
    
    //Take due note of the order of the objects as the incorrect refference will cause the value not to be dispayed
    [cell setObject:unitObject : roomObject: studentObject: dayTimeObject];

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
