//
//  KMInstagramMedia.m
//  InstaCollage
//
//  Created by Дмитрий on 07.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMInstagramMedia.h"
#import "KMInstagramComment.h"
#import "KMInstagramUserInPhoto.h"

@implementation KMInstagramMedia

- (instancetype)initWithInfo:(NSDictionary*)info {
    self = [super initWithInfo:info];
    if(self) {
        
        
        
        NSDictionary *imageInfo = info[@"images"];
        _lowResolutionURL = [NSURL URLWithString:imageInfo[@"low_resolution"][@"url"]];
        _standardResolutionURL = [NSURL URLWithString:imageInfo[@"standard_resolution"][@"url"]];
        _thumbnailURL = [NSURL URLWithString:imageInfo[@"thumbnail"][@"url"]];
        
        _lowResolutionImageSize = CGSizeMake([imageInfo[@"low_resolution"][@"width"] floatValue],
                                             [imageInfo[@"low_resolution"][@"height"] floatValue]);
        _standardResolutionImageSize = CGSizeMake([imageInfo[@"standard_resolution"][@"width"] floatValue],
                                             [imageInfo[@"standard_resolution"][@"height"] floatValue]);
        _thumbnailImageSize = CGSizeMake([imageInfo[@"thumbnail"][@"width"] floatValue],
                                             [imageInfo[@"thumbnail"][@"height"] floatValue]);
        
        _createdTime = [NSDate dateWithTimeIntervalSince1970:[info[@"created_time"] doubleValue]];
        
        _isVideo = [info[@"type"] isEqualToString:@"video"];
        _filter = [NSString stringWithString:info[@"filter"]];
        
        _user = [[KMInstagramUser alloc] initWithInfo:info[@"user"]];
        
        if(KMNotNull(info[@"caption"]))
            _caption = [[KMInstagramComment alloc] initWithInfo:info[@"caption"]];
        
        
        NSMutableArray *tempComments = [NSMutableArray arrayWithCapacity:[info[@"comments"] count]];
        for (NSDictionary *commentInfo in info[@"comments"][@"data"]) {
            KMInstagramComment *comment = [[KMInstagramComment alloc] initWithInfo:commentInfo];
            [tempComments addObject:comment];
        }
        _comments = [NSArray arrayWithArray:tempComments];
        
        NSMutableArray *tempUsersInPhoto = [NSMutableArray arrayWithCapacity:[info[@"users_in_photo"] count]];
        for (NSDictionary *userDict in info[@"users_in_photo"]) {
            KMInstagramUser *user = [[KMInstagramUserInPhoto alloc] initWithInfo:userDict];
            [tempUsersInPhoto addObject:user];
        }
        _usersInPhoto = [NSArray arrayWithArray:tempUsersInPhoto];
        
    }
    return self;
}

@end
