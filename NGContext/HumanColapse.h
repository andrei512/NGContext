//
//  HumanColapse.h
//  NGContext
//
//  Created by Andrei on 9/18/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HumanColapse : NSObject

+ (instancetype)createWithName:(NSString *)name;
+ (instancetype)createWithSex:(NSString *)sex;
+ (instancetype)createWithName:(NSString *)name andSex:(NSString *)sex;
- (id)initWithName:(NSString *)name;
- (id)initWithSex:(NSString *)sex;
- (id)initWithName:(NSString *)name andSex:(NSString *)sex;

@end

// crafted by Koder www.koder-tools.com
