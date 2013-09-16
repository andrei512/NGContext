//
//  NGContext.m
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGContext.h"
#import "NGFilter.h"

@implementation NGContext

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

#pragma mark - NSFastEnumeration 

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len {
    
    return [self.context countByEnumeratingWithState:state
                                             objects:buffer
                                               count:len];

}


@end
