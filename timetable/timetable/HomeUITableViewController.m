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
    self.array = [[NSMutableArray alloc]init];


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


    PFQuery * Unitquery = [PFQuery queryWithClassName:@"Unit"];
    
    [Unitquery findObjectsInBackgroundWithBlock:^(NSArray *UnitObject, NSError *error)
     
     {
         if(!error){
             
             NSLog(@"Successfully retrieved %lu TimeTable", (unsigned long)UnitObject.count);
             
             self.dataArrayunit = [UnitObject valueForKey:@"Unit_id"];
            /* self.dataArrayroom = [UnitObject valueForKey:@"Room_id"];
             self.dataArraycourse = [UnitObject valueForKey:@"Course_id"];
             self.dataArraylecurer = [UnitObject valueForKey:@"Lecturer_id"];
             self.dataArraystudent = [UnitObject valueForKey:@"Student_id"];
             */
             self.dataArrayunit = UnitObject;
             
             
             [self.datatable reloadData];
         }
    
        NSLog(@"%@",UnitObject);
        
    }];
    
    PFQuery * Roomquery = [PFQuery queryWithClassName:@"Room"];
    
    [Roomquery findObjectsInBackgroundWithBlock:^(NSArray *RoomObject, NSError *error)
     
     {
         if(!error){
             
             NSLog(@"Successfully retrieved %lu TimeTable", (unsigned long)RoomObject.count);
             
              //self.dataArrayunit = [RoomObject valueForKey:@"Unit_id"];
              self.dataArrayroom = [RoomObject valueForKey:@"Room_id"];
              //self.dataArraycourse = [RoomObject valueForKey:@"Course_id"];
              //self.dataArraylecurer = [RoomObject valueForKey:@"Lecturer_id"];
              //self.dataArraystudent = [RoomObject valueForKey:@"Student_id"];

             self.dataArrayroom = RoomObject;

             
             
           //  [self.datatable reloadData];
         }
         
         NSLog(@"%@",RoomObject);
         
     }];
    
    PFQuery * Studentquery = [PFQuery queryWithClassName:@"Student"];
    
    [Studentquery findObjectsInBackgroundWithBlock:^(NSArray *StudentObject, NSError *error)
     
     {
         if(!error){
             
             NSLog(@"Successfully retrieved %lu TimeTable", (unsigned long)StudentObject.count);
             
            // self.dataArrayunit = [StudentObject valueForKey:@"Unit_id"];
             //self.dataArrayroom = [StudentObject valueForKey:@"Room_id"];
           //  self.dataArraycourse = [StudentObject valueForKey:@"Course_id"];
           //  self.dataArraylecurer = [StudentObject valueForKey:@"Lecturer_id"];
             self.dataArraystudent = [StudentObject valueForKey:@"Student_id"];
             
             self.dataArraystudent = StudentObject;
             
             
           //  [self.datatable reloadData];
         }        NSLog(@"%@",StudentObject);
        
    }];
    
    PFQuery * Coursequery = [PFQuery queryWithClassName:@"Course"];
    
    [Coursequery findObjectsInBackgroundWithBlock:^(NSArray *CourseObject, NSError *error)
     
     {
         if(!error){
             
             NSLog(@"Successfully retrieved %lu TimeTable", (unsigned long)CourseObject.count);
             
             //self.dataArrayunit = [CourseObject valueForKey:@"Unit_id"];
             //self.dataArrayroom = [CourseObject valueForKey:@"Room_id"];
             self.dataArraycourse = [CourseObject valueForKey:@"Course_id"];
             //self.dataArraylecurer = [CourseObject valueForKey:@"Lecturer_id"];
             //self.dataArraystudent = [CourseObject valueForKey:@"Student_id"];

             self.dataArraycourse = CourseObject;
             
             
            // [self.datatable reloadData];
         }        NSLog(@"%@",CourseObject);
        
    }];
    
    PFQuery * Lecturerquery = [PFQuery queryWithClassName:@"Lecturer"];
    
    [Lecturerquery findObjectsInBackgroundWithBlock:^(NSArray *LecturerObject, NSError *error)
     
     {
         if(!error){
             
             NSLog(@"Successfully retrieved %lu TimeTable", (unsigned long)LecturerObject.count);
             
              //self.dataArrayunit = [LecturerObject valueForKey:@"Unit_id"];
              //self.dataArrayroom = [LecturerObject valueForKey:@"Room_id"];
              //self.dataArraycourse = [LecturerObject valueForKey:@"Course_id"];
              self.dataArraylecurer = [LecturerObject valueForKey:@"Lecturer_id"];
              //self.dataArraystudent = [LecturerObject valueForKey:@"Student_id"];

             self.dataArraylecurer = LecturerObject;
             
             
            // [self.datatable reloadData];
             
         }        NSLog(@"%@",LecturerObject);
        
    }];
    
    PFQuery * TimeTablequery = [PFQuery queryWithClassName:@"TimeTable"];
    //[TimeTablequery whereKey:@"Unit_id" matchesKey:@"Unit_id" inQuery:Unitquery];
    //[TimeTablequery whereKey:@"Room_id" matchesKey:@"Room_id" inQuery:Roomquery];
    //[TimeTablequery whereKey:@"Student_id" matchesKey:@"Student_id" inQuery:Studentquery];
    //[TimeTablequery whereKey:@"Lecturer_id" matchesKey:@"Lecturer_id" inQuery:Lecturerquery];
    //[TimeTablequery whereKey:@"Course_id" matchesKey:@"Course_id".self inQuery:Coursequery];
    [TimeTablequery findObjectsInBackgroundWithBlock:^(NSArray *TimeTableObject, NSError *error)
     
     {
         if(!error){
             
             NSLog(@"Successfully retrieved %lu TimeTable", (unsigned long)TimeTableObject.count);
             
             
             
             self.dataArray = TimeTableObject;
             
             
             [self.datatable reloadData];
         }        NSLog(@"%@",TimeTableObject);
        
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
    
    [self.array addObject:_dataArray];
    
    PFObject *tempObject = [_array objectAtIndex:indexPath.row];

    [cell setObject:tempObject];
    
    
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
