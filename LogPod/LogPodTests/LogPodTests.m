//
//  LogPodTests.m
//  LogPodTests
//
//  Created by Dadao on 2018/10/9.
//  Copyright © 2018 Dadao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PublicHeader.h"
@interface LogPodTests : XCTestCase

@end

@implementation LogPodTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    [YLLog log: 1 argument: @"hhh%@", @"YYYY"];
    
//    dispatch_semaphore_t semaphore_t = dispatch_semaphore_create(0);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        dispatch_semaphore_signal(semaphore_t);
//    });
//    
//    dispatch_semaphore_wait(semaphore_t, DISPATCH_TIME_FOREVER);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
