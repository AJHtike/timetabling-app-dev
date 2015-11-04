//
//  UserPortalHomeCustomCell.h
//  timetable
//
//  Created by Alex on 02/11/15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface UserPortalHomeCustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *unitLabel;

@property (weak, nonatomic) IBOutlet UILabel *DateLabel;

@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *RoomLabel;

@property (weak, nonatomic) IBOutlet UILabel *studentLabel;


//Added additional PFObject parameters to sent object to retrieve all data from PF query in HomeUITableViewController
- (void) setObject: (PFObject*) unitObject :(PFObject*) roomObject :(PFObject*) studentObject :(PFObject*) dayTimeObject;
@end
