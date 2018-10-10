//
//  YLReamHelper.h
//  LogPod
//
//  Created by Dadao on 2018/10/10.
//  Copyright © 2018 Dadao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
NS_ASSUME_NONNULL_BEGIN
@class RLMObject, RLMResults;
@interface YLReamHelper : NSObject
+ (instancetype)sharedHelper;

- (void)saveDatas:(NSArray<RLMObject *> *)datas;
- (void)deleteDatas:(RLMResults *)datas;

- (RLMResults *)queryDatasBefore:(NSDate *)date;

- (RLMResults *)queryDatasBefore:(NSDate *)date after:(NSDate *)after;
@end

NS_ASSUME_NONNULL_END
