//
//  KMInstagramUserInPhoto.m
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramUserInPhoto.h"

@implementation KMInstagramUserInPhoto

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super initWithInfo:info[@"user"]];
    if (self && KMNotNull(info)) {
        if (KMNotNull(info[@"position"])) {
            _position = CGPointMake([info[@"position"][@"x"] floatValue], [info[@"position"][@"y"] floatValue]);
        }
    }
    return self;
}

@end
