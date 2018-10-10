//
//  YLLog.m
//  LogPod
//
//  Created by Dadao on 2018/10/10.
//  Copyright © 2018 Dadao. All rights reserved.
//

#import "YLLog.h"
#import "YLLogManager.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "YLLogManager.h"

@protocol DDLoggerNodeProtocol <NSObject>
@property (nonatomic, readonly) id <DDLogger> logger;
@property (nonatomic, readonly) DDLogLevel level;
@property (nonatomic, readonly) dispatch_queue_t loggerQueue;
@end

@implementation YLLog

+ (void)configLog:(NSDictionary *)config
{
    
}

+ (void)log:(NSInteger)type file:(const char *)file function:(const char *)function line:(NSUInteger)line format:(NSString *)format, ...
{
    [YLLogManager manager];
    va_list args;
    NSString *message;
    if(format) {
        va_start(args, format);
        message = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
    }
    
    
    DDLogMessage *logMessage = [[DDLogMessage alloc] initWithMessage:message level:DDLogLevelAll flag:DDLogFlagInfo context:0 file:[NSString stringWithFormat:@"%s", file] function:[NSString stringWithFormat:@"%s", function] line:line tag:0 options:(DDLogMessageOptions)0 timestamp:nil];
    
    
    [[DDLog sharedInstance] log:YES message:logMessage];
//    NSArray<id<DDLoggerNodeProtocol>> *loggers = [[DDLog sharedInstance] valueForKey:@"_loggers"];
//    [loggers enumerateObjectsUsingBlock:^(id<DDLoggerNodeProtocol> _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [obj.logger logMessage:logMessage];
//    }];
}

+ (void)flush
{
    [[DDLog sharedInstance] flushLog];
}
@end
