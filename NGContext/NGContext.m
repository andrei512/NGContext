//
//  NGContext.m
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGContext.h"
#import "NGFilter.h"
#import "NGEvent.h"
#import "NGSubscribedAction.h"
#import "NGItemSelector.h"
#import "NSObject+APIsA.h"

@implementation NGContext

- (id)init {
    if (self = [super init]) {
        self.subscribers = [NSMutableArray array];
    }
    return self;
}

- (void)on:(NSObject *)event do:(NGEventBlock)action {
    if (event.is_a(NGEvent) == YES) {
        [NGSubscribedAction subscribedAction:action
                                         for:(NGEvent *)event
                                   inContext:self];
    } else if (event.is_a(NSString) == YES) {
        [NGSubscribedAction subscribedAction:action
                                         for:[NGEvent eventNamed:(NSString *)event]
                                   inContext:self];
    }
}

- (void)post:(NGEvent *)event {
    for (NGSubscribedAction *subscribedAction in self.subscribers) {
        if ([event matchesEvent:subscribedAction.event]) {
            subscribedAction.action(event);
        }
    }
}


#pragma mark - NSFastEnumeration 

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len {
    
    return [self.context countByEnumeratingWithState:state
                                             objects:buffer
                                               count:len];

}


@end
