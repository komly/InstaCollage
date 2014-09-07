//
//  KMInstagramMedia.h
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramModel.h"
#import "KMInstagramUser.h"
#import "KMInstagramComment.h"

@interface KMInstagramMedia : KMInstagramModel

@property (nonatomic, readonly) NSURL *standardResolutionURL;
@property (nonatomic, readonly) CGSize standardResolutionImageSize;
@property (nonatomic, readonly) NSURL *lowResolutionURL;
@property (nonatomic, readonly) CGSize lowResolutionImageSize;
@property (nonatomic, readonly) NSURL *thumbnailURL;
@property (nonatomic, readonly) CGSize thumbnailImageSize;

@property (nonatomic, readonly) NSDate *createdTime;
@property (nonatomic, readonly) BOOL isVideo;
@property (nonatomic, readonly) NSString *filter;

@property (nonatomic, readonly) NSArray *comments;
@property (nonatomic, readonly) NSArray *usersInPhoto;
@property (nonatomic, readonly) KMInstagramUser *user;

@property (nonatomic, readonly) KMInstagramComment *caption;
@property (nonatomic, readonly) NSArray *tags;

- (instancetype)initWithInfo:(NSDictionary*)info;

@end
