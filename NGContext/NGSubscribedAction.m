//
//  NGSubscribedAction.m
//  NGContext
//
//  Created by Andrei on 9/17/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGSubscribedAction.h"

@implementation NGSubscribedAction

+ (NGSubscribedAction *)subscribedAction:(NGEventBlock)action
                                     for:(NGEvent *)event
                               inContext:(NGContext *)context {
    NGSubscribedAction *subscribedAction = [NGSubscribedAction new];
    
    subscribedAction.action = action;
    subscribedAction.event = event;
    subscribedAction.context = context;
    
    [context.subscribers addObject:subscribedAction];
    
    return subscribedAction;
}

- (void)unsubscribe {
    [self.context.subscribers removeObject:self];
}


@end
