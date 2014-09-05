//
//  KMInstagramManager.m
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramManager.h"
#import <AFNetworking.h>

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

- (void)getUserIdByUsername:(NSString*)aUsername Success:(void(^)(NSInteger *userId))aSuccess andFail:(id)aFail {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"f8979150126a418a948b3bd8a77c1d48" forKey:@"client_id"];
    [params setValue:aUsername forKey:@"q"];
    
    [self.manager GET:@"users/search" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@", responseObject);
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@", error);
        
    }];
}

@end
