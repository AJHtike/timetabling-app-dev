//
//  CourseDetailedTableViewCell.m
//  timetable
//
//  Created by Matthew Blurton on 5/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "CourseDetailedTableViewCell.h"

@implementation CourseDetailedTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setObject:(PFObject *)unitObject :(PFObject *)instructorObject :(PFObject *)roomObject :(PFObject *)timeOfDayObject {
    self.UnitIDLabel.text = unitObject[@"Unit_id"];
    self.DayLabel.text = timeOfDayObject[@"day_of_week"];
    self.TimeLabel.text = timeOfDayObject[@"time"];
    self.RoomLabel.text = roomObject[@"Room_id"];
    
    NSString *firstName = [instructorObject[@"Lecturer_name"] stringByAppendingString:@" "];
    NSString *fullName = [firstName stringByAppendingString:instructorObject[@"Lecturer_surname"]];
    self.InstructorLabel.text = fullName;
}

@end
