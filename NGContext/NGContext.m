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

- (NGSubscribedAction *)on:(NSObject *)event do:(NGEventBlock)action {
    if (event == nil) {
        return [NGSubscribedAction subscribedAction:action
                                                for:[NGEvent new]
                                          inContext:self];
    } else if (event.is_a(NGEvent) == YES) {
        return [NGSubscribedAction subscribedAction:action
                                                for:(NGEvent *)event
                                          inContext:self];
    } else if (event.is_a(NSString) == YES) {
        return [NGSubscribedAction subscribedAction:action
                                                for:[NGEvent eventNamed:(NSString *)event]
                                          inContext:self];
    }
    return nil;
}

- (void)post:(NSObject *)eventObject {
    if (eventObject != nil) {
        NGEvent *event =
            eventObject.is_a(NGEvent) ?
                (NGEvent *)eventObject :
                [NGEvent eventNamed:(NSString *)eventObject];
        
        for (NGSubscribedAction *subscribedAction in self.subscribers) {
            if ([event matchesEvent:subscribedAction.event]) {
                subscribedAction.action(event);
            }
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

// koded ;)

// koded ;)
