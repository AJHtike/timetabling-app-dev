//
//  CourseDetailedTableViewCell.m
//  timetable
//
//  Created by Matthew Blurton on 5/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setObject:(PFObject *)unitObject : (PFObject *)instructorObject : (PFObject *)roomObject : (PFObject *)timeOfDayObject : (PFObject *) studentObject {
    self.UnitIDLabel.text = unitObject[@"Unit_id"];
    self.DayLabel.text = timeOfDayObject[@"day_of_week"];
    self.TimeLabel.text = timeOfDayObject[@"time"];
    self.RoomLabel.text = roomObject[@"Room_id"];
    
    self.InstructorLabel.text = instructorObject[@"Lecturer_name"];
    self.StudentLabel.text = studentObject[@"Student_id"];
}

@end
