//
//  KMPickerViewController.h
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMPickerViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (assign, nonatomic) int userId;
@property (strong, nonatomic) NSMutableArray *photos;

@end
