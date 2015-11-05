//
//  CustomCell.m
//  timetable
//
//  Created by Alex on 02/11/15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//Added additional PFObject parameters to sent object to retrieve all data from PF query in HomeUITableViewController
- (void) setObject: (PFObject*) unitObject :(PFObject*) roomObject :(PFObject*) studentObject :(PFObject*) dayTimeObject {
    
    //Take due note of the order of objectSent as they need to correspond to the objects being retrieved
    
    @try {
        self.unitLabel.text = unitObject[@"Unit_id"];
    } @catch (NSException *) {
        self.unitLabel.text = @"No unit";
    }
    
    self.RoomLabel.text = roomObject[@"Room_id"];
    self.studentLabel.text = studentObject[@"Student_id"];
    self.DateLabel.text = dayTimeObject[@"day_of_week"];
    self.TimeLabel.text = dayTimeObject[@"time"];
}

@end
