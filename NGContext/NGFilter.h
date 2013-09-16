//
//  NGFilter.h
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGContext.h"

@interface NGFilter : NSObject<NSCopying>

@property (nonatomic, copy) NGFilterAction filterAction;

+ (instancetype)filterWith:(NGFilterAction)filterAction;

- (NSObject *)filter:(NSObject *)object;

@end
