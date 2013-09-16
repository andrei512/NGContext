//
//  NGItemSelector.h
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGRepository.h"

@interface NGItemSelector : NSObject<NSFastEnumeration>

@property (nonatomic, weak) NGRepository *repository;
@property (nonatomic, copy) NGFilterBlock filterBlock;
@property (nonatomic, strong) NSDictionary *cache;

+ (NGItemSelector *)selectorRepository:(NGRepository *)repository
                                filter:(NGFilterBlock)filter
                                 cache:(NSDictionary *)cache;

+ (NGItemSelector *)selectorRepository:(NGRepository *)repository
                                filter:(NGFilterBlock)filter;

+ (NGItemSelector *)selectorRepository:(NGRepository *)repository;


+ (NGItemSelector *)selectorWithItems:(id)items onRepository:(NGRepository *)repository;
+ (NGItemSelector *)selectorWithItems:(id)items;

- (void)iterate:(NGRepository *)repository with:(NGActionBlock)action;
- (void)iterateWith:(NGActionBlock)action;



@end
