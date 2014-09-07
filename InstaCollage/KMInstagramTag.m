//
//  KMInstagramTag.m
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramTag.h"

@implementation KMInstagramTag

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super initWithInfo:info];
    if(self && KMNotNull(info)) {
        
        if(KMNotNull(info[@"name"]))
            _name = info[@"name"];
        if(KMNotNull(info[@"media_count"]))
            _mediaCount = [info[@"media_count"] integerValue];
    }
    return self;
}

@end
