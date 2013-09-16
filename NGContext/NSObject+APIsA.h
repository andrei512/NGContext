//
//  NSObject+APIsA.h
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

#define is_a(XX) _is_a([XX class])

typedef BOOL(^IsABlock)(Class className);

@interface NSObject (APIsA)

- (IsABlock)_is_a;

@end
