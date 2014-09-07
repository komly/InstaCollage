//
//  KMInstagramTag.h
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramModel.h"

@interface KMInstagramTag : KMInstagramModel

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger mediaCount;

-(instancetype)initWithInfo:(NSDictionary *)info;

@end
