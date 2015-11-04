//
//  CourseUITableViewController.m
//  timetable
//
//  Created by Matthew Blurton on 4/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "CourseUITableViewController.h"

@interface CourseUITableViewController ()

@end

@implementation CourseUITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.dataArray = [[NSArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self retrieveFromParse];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) retrieveFromParse {
    // Queries Parse server to get Course object which is used by CourseUITableViewCell to prepare it's data
    
    PFQuery *TimeTablequery = [PFQuery queryWithClassName:@"Course"];
    
    [TimeTablequery findObjectsInBackgroundWithBlock:^( NSArray *TimeTableObject, NSError *error)
     {
         if (!error) {
             self.dataArray = TimeTableObject;
             
             [self.CourseTableView reloadData];
         }
         else {
             NSLog(@"Error occurred %@", [error description]);
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
    CourseUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CourseUITableViewCell" forIndexPath:indexPath];
    
    PFObject *courseObject = [self.dataArray objectAtIndex:indexPath.row];
    
    [cell setObject:courseObject];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewController *courseDetailed = [self.storyboard instantiateViewControllerWithIdentifier:@"CourseDetailedStoryboardID"];
    [self.navigationController pushViewController:courseDetailed animated:YES];
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
