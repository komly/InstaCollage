//
//  KMInstagramComment.h
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramModel.h"
#import "KMInstagramUser.h"

@interface KMInstagramComment : KMInstagramModel


@property (readonly) NSDate *createdTime;
@property (readonly) NSString *text;
@property (readonly) KMInstagramUser *user;


- (instancetype)initWithInfo:(NSDictionary*)info;

@end
