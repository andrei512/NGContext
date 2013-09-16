//
//  NGRepositoryAction.m
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGRepositoryAction.h"

@implementation NGRepositoryAction

- (void)performOnRepository:(NGRepository *)repository {
    [self.itemSelector iterate:repository
                          with:self.action];
}

@end
