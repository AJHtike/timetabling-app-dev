//
//  LecturerUITableViewCell.m
//  timetable
//
//  Created by Matthew Blurton on 4/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "LecturerUITableViewCell.h"

@implementation LecturerUITableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObject:(PFObject *)studentObject {
    NSString *firstName = studentObject[@"Lecturer_name"];
    NSString *surName = studentObject[@"Lecturer_surname"];
    NSString *firstNameBlank = [firstName stringByAppendingString:@" "];
    self.LecturerFullNameLabel.text = [firstNameBlank stringByAppendingString:surName];
}

@end
