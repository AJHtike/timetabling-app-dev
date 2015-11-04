//
//  CourseUITableViewCell.h
//  timetable
//
//  Created by Matthew Blurton on 4/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CourseUITableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *CourseCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *CourseTitleLabel;

- (void) setObject: (PFObject *) courseObject;

@end
