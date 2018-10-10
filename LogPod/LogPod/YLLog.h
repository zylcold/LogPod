//
//  YLLog.h
//  LogPod
//
//  Created by Dadao on 2018/10/10.
//  Copyright © 2018 Dadao. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface YLLog : NSObject
#define YLLog(x, frmt, ...) [YLLog log:x file:__FILE__ function:__FUNCTION__ line:__LINE__ format:(frmt), ## __VA_ARGS__];

+ (void)configLog:(NSDictionary *)config;

+ (void)log:(NSInteger)type file:(const char *)file function:(const char *)function line:(NSUInteger)line format:(NSString *)format, ...;

+ (void)flush;
@end
