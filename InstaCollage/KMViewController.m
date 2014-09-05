//
//  KMViewController.m
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMViewController.h"
#import "KMInstagramManager.h"

@interface KMViewController ()

@end

@implementation KMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UI Actions

- (IBAction)makeCollageAction:(id)sender {
    [[KMInstagramManager sharedManager] getUserIdByUsername:@"komly1" Success:^(NSInteger *userId) {
        
    } andFail:nil];
}

@end
