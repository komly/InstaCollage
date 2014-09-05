//
//  KMInstagramManager.h
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface KMInstagramManager : NSObject

@property(nonatomic, strong) AFHTTPRequestOperationManager *manager;

+(KMInstagramManager*)sharedManager;
- (void)getUserIdByUsername:(NSString*)aUsername Success:(void(^)(NSInteger *userId))aSuccess andFail:(id)aFail;

@end
