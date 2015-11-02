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
    
   
    self.DateLabel.text = objectSent[@"day_of_week"];
    self.TimeLabel.text = objectSent[@"time"];
    self.RoomLabel.text = objectSent[@"Room"];
    
    
}

@end
