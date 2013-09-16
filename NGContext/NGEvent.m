//
//  NGEvent.m
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGEvent.h"

@implementation NGEvent

+ (NGEvent *)eventNamed:(NSString *)eventName
                onItems:(NGItemSelector *)itemSelector
                   info:(NSDictionary *)eventInfo {
    NGEvent *event = [NGEvent new];
    
    event.name = eventName;
    event.itemSelector = itemSelector;
    event.eventInfo = eventInfo;
    
    return event;
}

+ (NGEvent *)eventNamed:(NSString *)eventName
                onItems:(NGItemSelector *)itemSelector {
    NGEvent *event = [NGEvent new];
    
    event.name = eventName;
    event.itemSelector = itemSelector;
    event.eventInfo = @{};
    
    return event;
}

+ (NGEvent *)eventNamed:(NSString *)eventName
                   info:(NSDictionary *)eventInfo {
    NGEvent *event = [NGEvent new];
    
    event.name = eventName;
    event.itemSelector = nil;
    event.eventInfo = eventInfo;
    
    return event;
}

+ (NGEvent *)eventNamed:(NSString *)eventName {
    NGEvent *event = [NGEvent new];
    
    event.name = eventName;
    event.itemSelector = nil;
    event.eventInfo = @{};
    
    return event;
}

- (NSArray *)subevents {
    return [self.name componentsSeparatedByString:@", "];
}

- (BOOL)matchesEvent:(NGEvent *)event {
    if (self.name != nil && event.name != nil) {
        BOOL matchesEventName = NO;
        for (NSString *subevent in self.subevents) {
            for (NSString *otherSubevent in event.subevents) {
                if ([subevent isEqualToString:otherSubevent] == YES) {
                    matchesEventName = YES;
                    break;
                }
            }
            if (matchesEventName == YES) {
                break;
            }
        }
        if (matchesEventName == NO) {
            return NO;
        }
    }
    
    return YES;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Event name: %@ info: %@", self.name, self.eventInfo];
}

@end
