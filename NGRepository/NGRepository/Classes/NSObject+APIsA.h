//
//  NSObject+APIsA.h
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

#define is_a(ClassName) _is_a([ClassName class])

typedef BOOL(^IsABlock)(Class class);

@interface NSObject (APIsA)

- (IsABlock)_is_a;

@end
