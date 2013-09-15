//
//  NGItemSelector.m
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGItemSelector.h"

@implementation NGItemSelector

+ (NGItemSelector *)selectorRepository:(NGRepository *)repository
                                filter:(NGFilterBlock)filter
                                 cache:(NSDictionary *)cache {
    NGItemSelector *selector = [NGItemSelector new];
    
    selector.repository = repository;
    selector.filterBlock = filter;
    selector.cache = cache;
    
    return selector;
}

+ (NGItemSelector *)selectorRepository:(NGRepository *)repository
                                filter:(NGFilterBlock)filter {
    return [self selectorRepository:repository
                             filter:filter
                              cache:nil];
}

+ (NGItemSelector *)selectorRepository:(NGRepository *)repository {
    return [self selectorRepository:repository
                             filter:^NGResult(id item) {
                                 return NGYes;
                             }
                              cache:nil];
}


+ (NGItemSelector *)selectorWithItems:(id)items {
    return [self selectorWithItems:items
                      onRepository:nil];
}

+ (NGItemSelector *)selectorWithItems:(id)items
                         onRepository:(NGRepository *)repository {
    NSObject *itemsObject = items;
    
    if (itemsObject.is_a(NGItemSelector)) {
        return (NGItemSelector *)itemsObject;
    } else if (itemsObject.is_a(NSArray)) {
        NSSet *itemSet = [NSSet setWithArray:(NSArray *)items];
        return [NGItemSelector selectorRepository:repository
                                           filter:^NGResult(id item) {
                                               return [itemSet containsObject:item] ? NGYes : NGNo;
                                           }];
    } else {
        // selects one item
        return [NGItemSelector selectorRepository:repository
                                           filter:^NGResult(id item) {
                                               return [itemsObject isEqual:item] ? NGYes : NGNo;
                                           }];
    }
}


- (void)iterate:(NGRepository *)repository with:(NGActionBlock)action {
    [repository each:^NGResult(id item) {
        return self.filterBlock(item) == NGBreak ? NGBreak : action(item);
    }];
}

- (void)iterateWith:(NGActionBlock)action {
    [self iterate:self.repository with:action];
}

#pragma NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len {
    return [self.repository countByEnumeratingWithState:state
                                                objects:buffer
                                                  count:len];
}

@end
