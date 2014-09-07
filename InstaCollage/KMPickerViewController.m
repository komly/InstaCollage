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
#import "KMPhotoCell.h"
#import "KMCollageViewControler.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface KMPickerViewController ()

@property (nonatomic, assign) int selectedPhotosCount;

@end


@implementation KMPickerViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.photos = [NSMutableArray array];
    self.selectedPhotosCount = 0;
    [self.collectionView registerClass:[KMPhotoCell class] forCellWithReuseIdentifier:@"PhotoCell"];
    self.collectionView.allowsSelection = YES;
    self.collectionView.allowsMultipleSelection = YES;
    [[KMInstagramManager sharedManager] getImagesByUserId:self.userId withSuccess:^(NSArray *photos) {
        
        self.photos = [photos mutableCopy];
        [self.collectionView reloadData];
        
    } andFail:^(NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
    
}

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KMPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    KMPhoto *photo = [self.photos objectAtIndex:indexPath.row];
    [cell.imageView setImageWithURL:photo.thumbnailUrl];
    
     cell.checkImageView.alpha = 0.0;
    if(photo.selected) {
        [cell.imageView.layer setOpacity:0.5];
        cell.checkImageView.alpha = 1.0;
    }
    else {
        cell.checkImageView.alpha = 0.0;
        [cell.imageView.layer setOpacity:1.0];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    KMPhoto *photo = [self.photos objectAtIndex:indexPath.row];
    if(!photo.selected) {
        if(self.selectedPhotosCount <5) {
            photo.selected = YES;
            self.selectedPhotosCount++;
        }
    }
    else {
        photo.selected = NO;
        self.selectedPhotosCount--;
    }
    
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
    
}


#pragma mark Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"collageSegue"]) {
        KMCollageViewControler *vc = segue.destinationViewController;
        
        NSMutableArray *photos = [NSMutableArray array];
        
        [self.photos enumerateObjectsUsingBlock:^(KMPhoto *photo, NSUInteger idx, BOOL *stop) {
            if(photo.selected) {
                [photos addObject:photo];
            }
        }];
        
        vc.photos = photos;
    }
}




@end
