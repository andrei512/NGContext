//
//  NGListRepository.m
//  NGRepository
//
//  Created by Andrei Puni on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGListRepository.h"
#import "NGAnonymusRepositoryDelegate.h"

@implementation NGListRepository

- (id)init {
    if (self = [super init]) {
        self.container = [NSMutableArray array];
    }
    return self;
}

- (void)add:(NSObject *)items {
    NSLog(@"add -> %@", items);
    if (items.is_a(NGRepository)) {
        for (NSObject *toAdd in (NGRepository *)items) {
            [self.list addObject:toAdd];
        }
    } else if (items.is_a(NSArray)) {
        [self.list addObjectsFromArray:(NSArray *)items];
    } else {
        [self.list addObject:items];
    }
    [super add:items];
}

- (void)edit:(NSObject *)items {
    NSLog(@"edit -> %@", items);
    [super edit:items];
}

- (void)remove:(NSObject *)items {
    NSLog(@"remove -> %@", items);
    [super remove:items];
}

- (void)did:(NGEvent *)event {
    NSLog(@"event -> %@", event);
    [super did:event];
}

- (NSMutableArray *)list {
    return (NSMutableArray *)self.container;
}


@end
