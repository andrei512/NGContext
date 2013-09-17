//
//  NGFilter.m
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGFilter.h"


@implementation NGFilter

+ (instancetype)filterWith:(NGFilterAction)filterAction {
    NGFilter *filter = [NGFilter new];
    
    filter.filterAction = filterAction;
    
    return filter;
}

- (NSObject *)filter:(NSObject *)object {
    return self.filterAction(object);
}

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] filterWith:self.filterAction];
}


@end

// koded ;)

// koded ;)
