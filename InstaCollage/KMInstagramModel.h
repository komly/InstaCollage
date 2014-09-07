//
//  KMInstagramModel.h
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMInstagramModel : NSObject

@property (readonly) NSString *Id;

- (instancetype)initWithInfo:(NSDictionary*)info;

@end


#define KMNotNull(obj) (obj && (![obj isEqual:[NSNull null]]) && (![obj isEqual:@"<null>"]))