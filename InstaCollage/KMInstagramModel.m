//
//  KMInstagramModel.m
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramModel.h"

@implementation KMInstagramModel

- (instancetype)initWithInfo:(NSDictionary*)info {
    self = [super init];
    if (self) {
        _Id = [NSString stringWithString:info[@"id"]];
    }
    return self;
}

@end
