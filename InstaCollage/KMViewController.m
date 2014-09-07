//
//  KMViewController.m
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMViewController.h"
#import "KMInstagramManager.h"
#import "KMPickerViewController.h"
#import "KMInstagramMedia.h"

@interface KMViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (assign, nonatomic) int userId;

@end

@implementation KMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.usernameTextField setDelegate:self];
    //205921560
    [[KMInstagramManager sharedManager] getUserById:@"205921560" success:^(KMInstagramUser *user) {
        NSLog(@"%@", user);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - UI Actions

- (IBAction)makeCollageAction:(id)sender {
    
    NSString *username = self.usernameTextField.text;
    
    [[KMInstagramManager sharedManager] getUserIdByUsername:username Success:^(int userId) {
        
        self.userId = userId;
        [self performSegueWithIdentifier:@"pickPhotosSegue" sender:self];
        
    } andFail:^(NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.usernameTextField resignFirstResponder];
    return YES;
}

#pragma mark segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"pickPhotosSegue"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        KMPickerViewController *pickerViewController = [navigationController.viewControllers objectAtIndex:0];
        pickerViewController.userId = self.userId;
    }
}

@end
