//
//  LecturersUITableViewController.h
//  timetable
//
//  Created by Matthew Blurton on 4/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "LecturerUITableViewCell.h"
#import "CourseDetailedTableViewController.h"

@interface LecturerUITableViewController : UITableViewController
@property (nonatomic,strong) NSArray *dataArray;

@property (strong, nonatomic) IBOutlet UITableView *LecturerTableView;

- (void) retrieveFromParse;

@end
