//
//  CourseWelcome.h
//  timetable
//
//  Created by Matthew Blurton on 29/10/2015.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseWelcome : NSObject

@property (nonatomic, weak) NSString *unit;
@property (nonatomic, weak) NSDate *day;
@property (nonatomic, weak) NSDate *time;
@property (nonatomic, weak) NSString *room;
@property (nonatomic) NSInteger *students;

@end
