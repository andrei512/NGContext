//
//  NSObject+APIsA.m
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NSObject+APIsA.h"

@implementation NSObject (APIsA)

- (IsABlock)_is_a {
    __block NSObject *selfb = self;
    return ^BOOL(Class class) {
        return [selfb isKindOfClass:class];
    };
}

@end
