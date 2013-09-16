//
//  NGEvent.m
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGEvent.h"


@implementation NGEvent

+ (instancetype)eventNamed:(NSString *)name
                   onItems:(id)items
                   andInfo:(NSDictionary *)eventInfo {
    NGEvent *event = [NGEvent new];
    
    event.name = name ?: NSStringFromClass(self.class);
    event.eventInfo = eventInfo ?: @{};
    event.itemSelector = [NGItemSelector selectorWithItems:items];
    
    
    return event;
}

+ (instancetype)eventNamed:(NSString *)name
                   onItems:(id)items {
    return [self eventNamed:name
                    onItems:items
                    andInfo:nil];
}

+ (instancetype)eventNamed:(NSString *)name {
    return [self eventNamed:name
                    onItems:nil
                    andInfo:nil];
}

@end
