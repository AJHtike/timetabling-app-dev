//
//  CourseUITableViewCell.m
//  timetable
//
//  Created by Matthew Blurton on 4/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "CourseUITableViewCell.h"

@implementation CourseUITableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setObject:(PFObject *)courseObject {
    // Sets the labels to change to the queried objects from the Parse database Course in Timetable
    self.CourseCodeLabel.text = courseObject[@"Course_id"];
    self.CourseTitleLabel.text = courseObject[@"Course_name"];
}

@end