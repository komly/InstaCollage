//
//  KMInstagramUserInPhoto.h
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramModel.h"
#import "KMInstagramUser.h"

@interface KMInstagramUserInPhoto : KMInstagramUser

@property (nonatomic, readonly) CGPoint position;

- (instancetype)initWithInfo:(NSDictionary *)info;

@end
