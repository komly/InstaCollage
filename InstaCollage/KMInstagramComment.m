//
//  KMInstagramComment.m
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramComment.h"

@implementation KMInstagramComment

- (instancetype)initWithInfo:(NSDictionary*)info {
    self = [super initWithInfo:info];
    if(self) {
        _createdTime = [NSDate dateWithTimeIntervalSince1970:[info[@"created_time"] doubleValue]];
        _text = [NSString stringWithString:info[@"text"]];
        _user = [[KMInstagramUser alloc] initWithInfo:info[@"from"]];
    }
    return self;
}


@end
