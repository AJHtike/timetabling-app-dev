//
//  CourseDetailedTableViewCell.h
//  timetable
//
//  Created by Matthew Blurton on 5/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *UnitIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *DayLabel;
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *RoomLabel;
@property (weak, nonatomic) IBOutlet UILabel *InstructorLabel;
@property (weak, nonatomic) IBOutlet UILabel *StudentLabel;

- (void) setObject: (PFObject*) unitObject :(PFObject*) instructorObject :(PFObject*) roomObject :(PFObject*) dayTimeObject :(PFObject*) studentObject;

@end
