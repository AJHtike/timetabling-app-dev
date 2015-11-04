//
//  CourseDetailedTableViewController.h
//  timetable
//
//  Created by Matthew Blurton on 5/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CourseDetailedTableViewController : UITableViewController
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *dataArrayunit;
@property (nonatomic,strong) NSArray *dataArraystudent;
@property (nonatomic,strong) NSArray *dataArraylecurer;
@property (nonatomic,strong) NSArray *dataArraycourse;
@property (nonatomic,strong) NSArray *dataArrayroom;


- (void) retrieveFromParse;

@end
