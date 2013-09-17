//
//  NGList.m
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGList.h"
#import "NGEvent.h"

@implementation NGList

- (id)init {
    if (self = [super init]) {
        self.context = [NSMutableArray array];
    }
    return self;
}

+ (NGList *)list {
    return [NGList new];
}

+ (NGList *)listWithArray:(NSArray *)array {
    NGList *list = [NGList list];
    list.context = [array mutableCopy];
    return list;
}

- (void)addObject:(NSObject *)object {
    [self.context addObject:object];
    [self post:[NGEvent eventNamed:@"add" info:@{ @"object" : object }]];
}

- (void)insertObject:(NSObject *)object atIndex:(int)index {
    [self.context insertObject:object atIndex:index];
    [self post:[NGEvent eventNamed:@"insert"
                              info:@{
                    @"object" : object,
                    @"index" : @(index)
                }]];
}

- (void)removeObject:(NSObject *)object {
    [self.context removeObject:object];
    [self post:[NGEvent eventNamed:@"remove"
                              info:@{
                    @"object" : object
                }]];
}

- (void)removeObjectAtIndex:(int)index {
    [self.context removeObjectAtIndex:index];
    [self post:[NGEvent eventNamed:@"remove"
                              info:@{
                    @"object" : self.context[index],
                    @"index" : @(index)
                }]];
}

- (void)replaceObjectAtIndex:(int)index withObject:(NSObject *)anObject {
    [self.context replaceObjectAtIndex:index withObject:anObject];
    [self post:[NGEvent eventNamed:@"edit"
                              info:@{
                    @"object" : self.context[index],
                    @"index" : @(index),
                    @"new" : anObject
                }]];
}

- (int)count {
    return self.context.count;
}

- (NSArray *)asArray {
    return [self.context copy];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return self.context[idx];
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    self.context[idx] = obj;
}

- (NSString *)description {
    return self.context.description;
}

@end

// koded ;)

// koded ;)
