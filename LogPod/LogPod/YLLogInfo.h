//
//  YLLogInfo.h
//  LogPod
//
//  Created by Dadao on 2018/10/10.
//  Copyright © 2018 Dadao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@interface YLLogInfo : RLMObject
@property(nonatomic, copy) NSString *message;
@property(nonatomic, copy) NSString *file;
@property(nonatomic, copy) NSString *method;
@property(nonatomic, strong) NSDate *timestamp;
@property(nonatomic, copy) NSString *log_level;
@property(nonatomic, assign) NSInteger line;
@end

