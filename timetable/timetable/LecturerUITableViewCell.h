//
//  LecturerUITableViewCell.h
//  timetable
//
//  Created by Matthew Blurton on 4/11/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LecturerUITableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *LecturerFullNameLabel;

- (void) setObject : (PFObject *) studentObject;

@end
