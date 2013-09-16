//
//  NGContext.h
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+APIsA.h"

typedef enum {
    NGResultNo = 0,
    NGResultYes = 1,
    NGResultBreak = -1,
    NGResultContinue = -2    
} NGResult;

typedef NGResult(^NGAction)(NSObject *params);
typedef NSObject *(^NGFilterAction)(id params);

@interface NGContext : NSObject<NSFastEnumeration>

@property (nonatomic, strong) NSObject<NSFastEnumeration> *context;

@end
