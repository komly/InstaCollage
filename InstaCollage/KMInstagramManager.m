//
//  KMInstagramManager.m
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramManager.h"
#import "KMPhoto.h"
#import <AFNetworking.h>

static NSString *kClientId =  @"f8979150126a418a948b3bd8a77c1d48";

@implementation KMInstagramManager


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
    [params setValue:@10 forKey:@"COUNT"];
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
