//
//  NGRepositoryAction.h
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGItemSelector.h"

@interface NGRepositoryAction : NSObject

@property (nonatomic, strong) NGItemSelector *itemSelector;
@property (nonatomic, strong) NGActionBlock action;
@property (nonatomic, strong) NSString *name;

- (NGEvent *)willPerformEvent;
- (NGEvent *)didPerformEvent;

- (void)performOnRepository:(NGRepository *)repository;

@end
