//
//  CustomCell.h
//  timetable
//
//  Created by Alex on 02/11/15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *unitLabel;

@property (weak, nonatomic) IBOutlet UILabel *DateLabel;

@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *RoomLabel;

@property (weak, nonatomic) IBOutlet UILabel *studentLabel;

- (void) setObject: (PFObject*) objectSent;
@end
