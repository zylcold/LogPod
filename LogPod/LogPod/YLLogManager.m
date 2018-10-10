//
//  YLLogManager.m
//  LogPod
//
//  Created by Dadao on 2018/10/10.
//  Copyright © 2018 Dadao. All rights reserved.
//

#import "YLLogManager.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "YLRealmLogger.h"
@implementation YLLogManager
+ (instancetype)manager
{
    static YLLogManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [YLLogManager new];
    });
    return manager;
}

- (void)loadConfig:(NSDictionary *)config
{
    
}

- (instancetype)init
{
    if(self = [super init]) {
        [DDLog addLogger:[YLRealmLogger new] withLevel:DDLogLevelAll];
        [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelAll];
        [DDLog addLogger:[DDASLLogger sharedInstance] withLevel:DDLogLevelAll];
    }
    return self;
}
@end
