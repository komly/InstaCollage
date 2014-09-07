//
//  KMInstagramManager.m
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramManager.h"
#import "KMPhoto.h"
#import "KMInstagramModel.h"
#import "KMInstagramPaginationInfo.h"
#import "KMInstagramMedia.h"
#import <AFNetworking.h>

static NSString *kClientId =  @"f8979150126a418a948b3bd8a77c1d48";

@implementation KMInstagramManager


#pragma mark - Initialization

- (instancetype)init {
    
    self = [super init];
    if (self) {
        NSURL *baseUrl = [NSURL URLWithString:@"https://api.instagram.com/v1/"];
        self.manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseUrl];
    }
    return self;
}

+(KMInstagramManager*)sharedManager {
    
    static KMInstagramManager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[KMInstagramManager alloc] init];
    });
    
    return instance;
    
}

#pragma mark - Generic requests wrappers

- (void)getPath:(NSString*)aPath
     modelClass:(Class)aModelClass
     params:(NSDictionary*)aParams
     success:(void(^)(id response, KMInstagramPaginationInfo *paginationInfo))aSuccess
     failure:(void(^)(NSError *error, NSInteger statusCode))aFailure {
    
    //Prepate params
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:aParams];
    params[@"client_id"] = kClientId;
    //TODO: client_id or access_token
    
    NSString *path = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    [self.manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
        
        NSDictionary *paginationDict = responseDictionary[@"pagination"];
        KMInstagramPaginationInfo *paginationInfo = [[KMInstagramPaginationInfo alloc] initWithDictionary:paginationDict andObjectType:aModelClass];
        
        BOOL multiple = [responseDictionary[@"data"] isKindOfClass:[NSArray class]];
        if(multiple) {
            NSArray *responseObjects = responseDictionary[@"data"];
            NSMutableArray *objects = [NSMutableArray arrayWithCapacity:responseObjects.count];
            
            for (NSDictionary *info in responseObjects) {
                id model = [[aModelClass alloc] initWithInfo:info];
                [objects addObject:model];
            }
            
            aSuccess(objects, paginationInfo);
        }
        
        
        aSuccess(responseDictionary, paginationInfo);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        aFailure(error, [[operation response] statusCode]);
    }];
    
}


#pragma mark - User methods


- (void)getMediaForUser:(NSString*)userId
            withSuccess:(KMInstagramMediaBlock)succes
                failure:(KMInstagramFailureBlock)failure {
    [self getPath:[NSString stringWithFormat:@"users/%@/media/recent",userId] modelClass:[KMInstagramMedia class] params:nil success:^(id response, KMInstagramPaginationInfo *paginationInfo) {
        if(succes) {
            NSArray *objects = response;
            succes(objects, paginationInfo);
        }
    } failure:^(NSError *error, NSInteger statusCode) {
        if(failure) {
            failure(error);
        }
    }];
}



- (void)getUserIdByUsername:(NSString*)aUsername Success:(void(^)(int userId))aSuccess andFail:(void(^)(NSError *error))aFail {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:kClientId forKey:@"client_id"];
    [params setValue:aUsername forKey:@"q"];
    
    [self.manager GET:@"users/search" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        int userId = [responseObject[@"data"][0][@"id"] intValue];
        aSuccess(userId);
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        aFail(error);
        
    }];
}

- (void)getImagesByUserId:(int)aUserid withSuccess:(void(^)(NSArray *photos))aSuccess andFail:(void(^)(NSError *error))aFail{
   NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:kClientId forKey:@"client_id"];
    [params setValue:@40 forKey:@"COUNT"];
    NSString *requestString = [NSString stringWithFormat:@"users/%d/media/recent", aUserid];
    
    [self.manager GET:requestString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *data = responseObject[@"data"];
        NSMutableArray *photos = [NSMutableArray array];
        
        [data enumerateObjectsUsingBlock:^(NSDictionary *photo, NSUInteger idx, BOOL *stop) {
            KMPhoto *tempPhoto = [[KMPhoto alloc] init];
            tempPhoto.lowUrl        = [NSURL URLWithString:photo[@"images"][@"low_resolution"][@"url"]];
            tempPhoto.standardUrl   = [NSURL URLWithString:photo[@"images"][@"standard_resolution"][@"url"]];
            tempPhoto.thumbnailUrl  = [NSURL URLWithString:photo[@"images"][@"thumbnail"][@"url"]];
            [photos addObject:tempPhoto];
            
        }];
        aSuccess(photos);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        aFail(error);
    }];
    
    
}

@end
