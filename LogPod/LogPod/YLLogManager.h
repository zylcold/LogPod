//
//  YLLogManager.h
//  LogPod
//
//  Created by Dadao on 2018/10/10.
//  Copyright © 2018 Dadao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLLogManager : NSObject
+ (instancetype)manager;

- (void)loadConfig:(NSDictionary *)config;
@end

NS_ASSUME_NONNULL_END
