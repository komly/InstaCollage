//
//  KMInstagramPaginationInfo.h
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMInstagramPaginationInfo : NSObject

@property (readonly) NSURL *nextURL;
@property (readonly) NSString *nextMaxId;
@property (readonly) Class type;

- (instancetype)initWithDictionary:(NSDictionary*)info andObjectType:(Class)type;

@end
