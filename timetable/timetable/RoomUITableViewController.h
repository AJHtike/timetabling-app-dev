//
//  RoomUITableViewController.h
//  timetable
//
//  Created by Matthew Blurton on 4/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "RoomUITableViewCell.h"
#import "CourseDetailedTableViewController.h"

@interface RoomUITableViewController : UITableViewController
@property (nonatomic,strong) NSArray *dataArray;
@property (strong, nonatomic) IBOutlet UITableView *roomTableView;

- (void)retrieveFromParse;

@end
