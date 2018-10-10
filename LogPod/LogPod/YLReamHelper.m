//
//  YLReamHelper.m
//  LogPod
//
//  Created by Dadao on 2018/10/10.
//  Copyright © 2018 Dadao. All rights reserved.
//

#import "YLReamHelper.h"
#import <Realm/Realm.h>
#import "YLLogInfo.h"
@implementation YLReamHelper
+ (instancetype)sharedHelper
{
    static YLReamHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [YLReamHelper new];
    });
    return helper;
}

- (instancetype)init
{
    if(self = [super init]) {
        RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
        NSLog(@"%@", config.fileURL);
        
        config.schemaVersion = 2;
        config.migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion) {
            // We haven’t migrated anything yet, so oldSchemaVersion == 0
            if (oldSchemaVersion < 2) {

            }
        };
        
        [RLMRealmConfiguration setDefaultConfiguration:config];
    }
    return self;
}

- (void)deleteDatas:(RLMResults *)datas
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteObjects:datas];
    }];
}

- (void)saveDatas:(NSArray<RLMObject *> *)datas
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObjects:datas];
    }];
}

- (RLMResults *)queryDatasBefore:(NSDate *)date
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    return [YLLogInfo objectsInRealm:realm withPredicate:[NSPredicate predicateWithFormat:@"%K <= %@", @"timestamp", date]];
}

- (RLMResults *)queryDatasBefore:(NSDate *)date after:(NSDate *)after
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    return [YLLogInfo objectsInRealm:realm withPredicate:[NSPredicate predicateWithFormat:@"%K <= %@ AND %K >= %@", @"timestamp", date, @"timestamp", after]];
}
@end
