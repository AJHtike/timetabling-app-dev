//
//  HomeUITableViewController.h
//  timetable
//
//  Created by Matthew Blurton on 29/10/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface HomeUITableViewController : UITableViewController


@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *dataArrayunit;
@property (nonatomic,strong) NSArray *dataArraystudent;
@property (nonatomic,strong) NSArray *dataArraylecurer;
@property (nonatomic,strong) NSArray *dataArraycourse;
@property (nonatomic,strong) NSArray *dataArrayroom;

// @property (nonatomic,strong) NSArray *dataArrayFiltered;

@property (nonatomic,weak) IBOutlet UITableView *datatable;

- (void) retrieveFromParse;


@end