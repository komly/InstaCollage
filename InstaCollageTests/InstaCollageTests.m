//
//  InstaCollageTests.m
//  InstaCollageTests
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KMInstagramManager.h"

@interface InstaCollageTests : XCTestCase

@end

@implementation InstaCollageTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void) shoudReturnMediaList
{
    [[KMInstagramManager sharedManager] getMediaForUser:@"205921560" withSuccess:^(NSArray *media, KMInstagramPaginationInfo *paginationInfo) {
        XCTAssertNotNil(media, @"Media is nil");
    } failure:^(NSError *error) {
        XCTAssertNil(error, "Error is not nil");
        NSLog(@"%@",error);
    }];
}
@end
