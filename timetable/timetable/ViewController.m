//
//  ViewController.m
//  timetable
//
//  Created by Alex on 04/10/15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "ViewController.h"
#import "StudentPortalViewController.h"

@interface ViewController ()  <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txfUsername;
@property (weak, nonatomic) IBOutlet UITextField *txfPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.txfUsername.delegate = self;
    self.txfPassword.delegate = self;
}


// Used by txfUsername and txfPassword to identify when the return
// key is pressed.
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Removes the software keyboard
    [textField resignFirstResponder];
    
    // If return was pressed while txfUsername was in use
    // give focus to txfPassword
    if (textField == self.txfUsername)
    {
        [self.txfPassword becomeFirstResponder];
    }
    
    // If return was pressed while txfPassword was in use
    // call the navigation helper and jump to the view controller
    // with a storyboard id of "userPortalViewController"
    else if (textField == self.txfPassword)
    {
        UIViewController *userController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarUserPortal"];
        
        [self.navigationController pushViewController:userController animated:YES];
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
