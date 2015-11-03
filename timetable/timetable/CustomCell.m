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

- (void) setObject: (PFObject*) objectSent {
    
    self.RoomLabel.text = objectSent[@"Room_id"];
    self.studentLabel.text = objectSent[@"Student_id"];
    self.unitLabel.text = objectSent[@"Unit_id"];
    self.DateLabel.text = objectSent[@"day_of_week"];
    self.TimeLabel.text = objectSent[@"time"];
}

@end
