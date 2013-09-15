//
//  NGRepository.h
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGRepositoryDelegate.h"
#import "NSObject+APIsA.h"

@class NGRepositoryAction;

typedef enum NGResult {
    NGNo = 0,
    NGYes = 1,
    NGBreak = -1,
    NGContinue = -2
} NGResult;

typedef NGResult(^NGFilterBlock)(id item);
typedef NGResult(^NGActionBlock)(id item);

@interface NGRepository : NSObject<NSFastEnumeration>

@property (nonatomic, strong) NGRepository *delegates;
@property (nonatomic, strong) NSObject<NSFastEnumeration> *container;

+ (instancetype)repositoryWith:(NSObject *)items;

- (void)add:(id)items;
- (void)remove:(id)items;
- (void)edit:(id)items;

- (void)did:(NGEvent *)event;
- (void)perform:(NGRepositoryAction *)action;

- (void)each:(NGActionBlock)action;

- (int)count;

// DSL
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;

- (id)objectForKeyedSubscript:(id <NSCopying>)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

@end
