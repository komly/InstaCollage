//
//  KMInstagramPaginationInfo.m
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramPaginationInfo.h"

@implementation KMInstagramPaginationInfo

- (instancetype)initWithDictionary:(NSDictionary*)aInfo andObjectType:(Class)aType {
    self = [super init];
    if (self) {
        _nextURL = aInfo[@"next_url"];
        _nextMaxId = aInfo[@"next_max_id"];
        _type = aType;
    }
    return self;
}

@end
