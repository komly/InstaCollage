//
//  KMPickerViewController.m
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMPickerViewController.h"
#import "KMInstagramManager.h"
#import "KMPhoto.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation KMPickerViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.photos = [NSMutableArray array];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"PhotoCell"];
    
    [[KMInstagramManager sharedManager] getImagesByUserId:self.userId withSuccess:^(NSArray *photos) {
        
        self.photos = [photos mutableCopy];
        [self.collectionView reloadData];
        
    } andFail:^(NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    
    UIImageView *view = [[UIImageView alloc] initW];
    KMPhoto *photo = [self.photos objectAtIndex:indexPath.row];
    
    [view setImageWithURL:[photo thumbnailUrl]];
    
    [cell.contentView addSubview:view];
    return cell;
}

#pragma mark - UICollectionViewDelegate

@end
