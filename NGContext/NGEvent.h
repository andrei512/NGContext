//
//  NGEvent.h
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NGItemSelector;

@interface NGEvent : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NGItemSelector *itemSelector;
@property (nonatomic, strong) NSDictionary *eventInfo;

+ (NGEvent *)eventNamed:(NSString *)eventName
                onItems:(NGItemSelector *)itemSelector
                   info:(NSDictionary *)eventInfo;

+ (NGEvent *)eventNamed:(NSString *)eventName
                onItems:(NGItemSelector *)itemSelector;

+ (NGEvent *)eventNamed:(NSString *)eventName
                   info:(NSDictionary *)eventInfo;

+ (NGEvent *)eventNamed:(NSString *)eventName;

- (BOOL)matchesEvent:(NGEvent *)event;

@end

// koded ;)

// koded ;)

// crafted by Koder www.koder-tools.com
