//
//  KMInstagramUser.m
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramUser.h"

@implementation KMInstagramUser


- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super initWithInfo:info];
    if (self && KMNotNull(info)) {
        _username = [NSString stringWithString:info[@"username"]];
        _fullName = [NSString stringWithString:info[@"full_name"]];
        _profilePictureURL = [NSURL URLWithString:info[@"profile_picture"]];
        
        if(KMNotNull(info[@"bio"]))
         _bio = [NSString stringWithString:info[@"bio"]];
        
        if(KMNotNull(info[@"website"]))
        _website = [NSString stringWithString:info[@"website"]];
        
        if(KMNotNull(info[@"counts"])) {
         _mediaCount = [info[@"counts"][@"media"] integerValue];
         _folowsCount = [info[@"counts"][@"follows"] integerValue];
         _folowedByCount = [info[@"counts"][@"followed_by"] integerValue];
        }
    }
    return self;
}

@end
