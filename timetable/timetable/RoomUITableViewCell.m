//
//  RoomUITableViewCell.m
//  timetable
//
//  Created by Matthew Blurton on 4/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "RoomUITableViewCell.h"

@implementation RoomUITableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setObject:(PFObject *)roomObject {
    self.RoomNumberLabel.text = roomObject[@"Room_id"];
}

@end
