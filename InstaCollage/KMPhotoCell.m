//
//  KMPhotoCell.m
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMPhotoCell.h"

@implementation KMPhotoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:self.imageView];
        UIImage *checkImage = [[UIImage imageNamed:@"check"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.checkImageView = [[UIImageView alloc] initWithImage:checkImage];
        self.checkImageView.alpha = 0.7;
        self.checkImageView.center = CGPointMake(80, 80);
        self.checkImageView.tintColor = [UIColor greenColor];
        [self addSubview:self.checkImageView];
    }
    return self;
}

@end
