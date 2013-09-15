//
//  NGRepository.m
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGRepository.h"
#import "NGRepositoryAction.h"

@implementation NGRepository

+ (instancetype)repositoryWith:(NSObject *)items {
    if (items.is_a(NGRepository)) {
        return (NGRepository *)items;
    } else if (items.is_a(NSArray)) {
        return nil;
    } else {
        return nil;
    }
}

- (void)add:(id)items {
    for (NSObject<NGRepositoryDelegate> *delegate in self.delegates) {
        [delegate repository:self didAdd:[NGRepository repositoryWith:items]];
    }
}

- (void)remove:(id)items {
    for (NSObject<NGRepositoryDelegate> *delegate in self.delegates) {
        [delegate repository:self didRemove:[NGRepository repositoryWith:items]];
    }
}

- (void)edit:(id)items {
    for (NSObject<NGRepositoryDelegate> *delegate in self.delegates) {
        [delegate repository:self didEdit:[NGRepository repositoryWith:items]];
    }
}

- (void)did:(NGEvent *)event {
    for (NSObject<NGRepositoryDelegate> *delegate in self.delegates) {
        [delegate repository:self did:event];
    }
}

- (void)perform:(NGRepositoryAction *)action {
    [self did:action.willPerformEvent];
    
    [action performOnRepository:self];
    
    [self did:action.didPerformEvent];
}


- (void)each:(NGActionBlock)action {
    for (NSObject *object in self) {
        NGResult result = action(object);
        if (result == NGBreak) {
            break;
        }
    }
}


- (int)count {
    if ([self.container respondsToSelector:@selector(count)] == YES) {
        return (int)[self.container performSelector:@selector(count)];
    }
    return 0;
}

#pragma - NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len {
    return [self.container countByEnumeratingWithState:state
                                               objects:buffer
                                                 count:len];
}

#pragma - DSL

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    if ([self.container respondsToSelector:@selector(objectAtIndexedSubscript:)]) {
        return [(NGRepository *)self.container objectAtIndexedSubscript:idx];
    }
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    if ([self.container respondsToSelector:@selector(setObject:atIndexedSubscript:)]) {
        return [(NGRepository *)self.container setObject:obj atIndexedSubscript:idx];
    }
}

- (id)objectForKeyedSubscript:(id <NSCopying>)key {
    
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key {
    
}

@end
