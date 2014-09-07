//
//  KMInstagramManager.h
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "KMInstagramPaginationInfo.h"


@class KMInstagramUser;

typedef void(^KMInstagramMediaBlock)(NSArray *media, KMInstagramPaginationInfo *paginationInfo);
typedef void(^KMInstagramFailureBlock)(NSError *error);
typedef void(^KMInstagramUserBlock)(KMInstagramUser *user);
@interface KMInstagramManager : NSObject

@property(nonatomic, strong) AFHTTPRequestOperationManager *manager;

+(KMInstagramManager*)sharedManager;

- (void)getUserIdByUsername:(NSString*)aUsername Success:(void(^)(int userId))aSuccess andFail:(void(^)(NSError *error))aFail;
- (void)getImagesByUserId:(int)aUserid withSuccess:(void(^)(NSArray *photos))aSuccess andFail:(void(^)(NSError *error))aFail;

- (void)getPath:(NSString*)aPath
     modelClass:(Class)aModelClass
         params:(NSDictionary*)aParams
        success:(void(^)(id response, KMInstagramPaginationInfo *paginationInfo))aSuccess
        failure:(void(^)(NSError *error, NSInteger statusCode))aFailure;

// User methods

- (void)getMediaForUser:(NSString*)userId
            withSuccess:(KMInstagramMediaBlock)aSucces
                failure:(KMInstagramFailureBlock)aFailure;

- (void)getUserById:(NSString*)userId
            success:(KMInstagramUserBlock)aSuccess
            failure:(KMInstagramFailureBlock)aFailure;
@end
