//
//  ViewController.h
//  timetable
//
//  Created by Alex on 04/10/15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *dataArrayunit;
@property (nonatomic,strong) NSArray *dataArraystudent;
@property (nonatomic,strong) NSArray *dataArraylecurer;
@property (nonatomic,strong) NSArray *dataArraycourse;
@property (nonatomic,strong) NSArray *dataArrayroom;

@property (weak, nonatomic) IBOutlet UITextField *txfUsername;
@property (weak, nonatomic) IBOutlet UITextField *txfPassword;
@end

