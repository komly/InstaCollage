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


@end
