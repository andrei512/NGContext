//
//  NGSubscribedAction.h
//  NGContext
//
//  Created by Andrei on 9/17/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGContext.h"

@interface NGSubscribedAction : NSObject

@property (nonatomic, copy) NGEventBlock action;
@property (nonatomic, strong) NGEvent *event;
@property (nonatomic, weak) NGContext *context;

+ (NGSubscribedAction *)subscribedAction:(NGEventBlock)action
                                     for:(NGEvent *)event
                               inContext:(NGContext *)context;

- (void)unsubscribe;


@end
