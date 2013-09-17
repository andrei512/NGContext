//
//  NGContext.h
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NGSubscribedAction;
@class NGEvent;

typedef void(^NGEventBlock)(NGEvent *event);

typedef enum {
    NGNo = 0,
    NGYes = 1,
    NGBreak = -1,
    NGContinue = -2    
} NGResult;

typedef NGResult(^NGAction)(NSObject *);
typedef NSObject *(^NGFilterAction)(id);

@interface NGContext : NSObject<NSFastEnumeration>

@property (nonatomic, strong) NSMutableArray *subscribers;

@property (nonatomic, strong) NSObject<NSFastEnumeration> *context;

- (NGSubscribedAction *)on:(NSObject *)event do:(NGEventBlock)action;
- (void)post:(NSObject *)event;

@end

// koded ;)

// koded ;)

// crafted by Koder www.koder-tools.com
