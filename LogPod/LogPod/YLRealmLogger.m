//
//  YLRealmLogger.m
//  LogPod
//
//  Created by Dadao on 2018/10/10.
//  Copyright © 2018 Dadao. All rights reserved.
//

#import "YLRealmLogger.h"
#import "YLReamHelper.h"
#import "YLLogInfo.h"
@interface YLRealmLogger()
@property(nonatomic, strong) YLReamHelper *helper;
@property(nonatomic, strong) NSMutableArray *logPayloads;
@end
@implementation YLRealmLogger
- (id)init
{
    if(self = [super init]) {
        self.helper = [[YLReamHelper alloc] init];
    }
    return self;
}


- (BOOL)db_log:(DDLogMessage *)logMessage {

    if(!_logPayloads) {
        _logPayloads = [NSMutableArray arrayWithCapacity:500];
    }
    
    if(_logPayloads.count > 2000) {
        return YES;
    }
    
    NSString *logString = logMessage->_message;
    
    if (self->_logFormatter) {
        logString = [self->_logFormatter formatLogMessage:logMessage];
    }
    
    if (logString) {
        NSDictionary *extraLogPayload = [self extraLogPayloadFromLogMessage:logMessage];
        YLLogInfo *info = [[YLLogInfo alloc] init];
        info.message = logString;
        info.method = extraLogPayload[@"method"];
        info.file = extraLogPayload[@"file"];
        info.timestamp = extraLogPayload[@"timestamp"];
        info.log_level = extraLogPayload[@"log_level"];
        info.line = [extraLogPayload[@"line"] integerValue];
        [_logPayloads addObject:info];
    }
    
    return YES;
}

- (void)db_save {
    if (![self isOnInternalLoggerQueue]) {
        NSAssert(NO, @"db_saveAndDelete should only be executed on the internalLoggerQueue thread, if you‘re seeing this, your doing it wrong.");
    }
    
    if ([_logPayloads count] == 0) {
        return;
    }
    
    NSArray *oldLogMessagesArray = [_logPayloads copy];
    [self.helper saveDatas:oldLogMessagesArray];
    [_logPayloads removeAllObjects];
}

- (void)db_delete {
    RLMResults *results = [self.helper queryDatasBefore:[NSDate dateWithTimeIntervalSinceNow:self.maxAge*60*60*24]];
    [self.helper deleteDatas:results];
    
}

- (void)db_saveAndDelete {
    [self db_delete];
    [self db_save];
}


- (NSDictionary *)extraLogPayloadFromLogMessage:(DDLogMessage *)logMessage
{
    NSString *log_level = @"info";
    switch (logMessage->_level) {
        case DDLogLevelInfo:
            log_level = @"info";
            break;
        case DDLogLevelDebug:
            log_level = @"debug";
            break;
        case DDLogLevelError:
            log_level = @"error";
            break;
        case DDLogLevelVerbose:
            log_level = @"verbose";
            break;
        case DDLogLevelWarning:
            log_level = @"waring";
            break;
        default:
            log_level = @"info";
            break;
    }
    
    NSDictionary *logPayload = @{
                                 @"file": logMessage.fileName,
                                 @"method": logMessage.function,
                                 @"timestamp": logMessage->_timestamp,
                                 @"log_level": log_level,
                                 @"line": @(logMessage->_line),
                                 };
    
    return logPayload;
}

@end
