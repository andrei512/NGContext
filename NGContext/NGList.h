//
//  NGList.h
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGContext.h"

@interface NGList : NGContext

@property (nonatomic, strong) NSMutableArray *context;

+ (NGList *)list;
+ (NGList *)listWithArray:(NSArray *)array;

- (void)addObject:(NSObject *)object;
- (void)insertObject:(NSObject *)object atIndex:(int)index;

- (void)removeObject:(NSObject *)object;
- (void)removeObjectAtIndex:(int)index;

- (void)replaceObjectAtIndex:(int)index withObject:(NSObject *)anObject;

- (int)count;
- (NSArray *)asArray;

// [int]
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;



@end
