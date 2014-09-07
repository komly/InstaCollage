//
//  KMInstagramUser.h
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramModel.h"

@interface KMInstagramUser : KMInstagramModel

@property (nonatomic, readonly) NSString *username;
@property (nonatomic, readonly) NSString *fullName;
@property (nonatomic, readonly) NSURL  *profilePictureURL;
@property (nonatomic, readonly) NSString *bio;
@property (nonatomic, readonly) NSString *website;
@property (nonatomic, readonly) NSInteger mediaCount;
@property (nonatomic, readonly) NSInteger folowsCount;
@property (nonatomic, readonly) NSInteger folowedByCount;

- (instancetype)initWithInfo:(NSDictionary *)info;


@end
