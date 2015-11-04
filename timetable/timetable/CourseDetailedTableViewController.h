//
//  CourseDetailedTableViewController.h
//  timetable
//
//  Created by Matthew Blurton on 5/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DetailTableViewCell.h"

@interface CourseDetailedTableViewController : UITableViewController
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *dataArrayunit;
@property (nonatomic,strong) NSArray *dataArraystudent;
@property (nonatomic,strong) NSArray *dataArraylecturer;
@property (nonatomic,strong) NSArray *dataArrayroom;

@property (nonatomic,strong) NSString *objectID;

@property (strong, nonatomic) IBOutlet UITableView *detailedTableView;

- (void) retrieveFromParse;

@end
