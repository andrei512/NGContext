//
//  NGAnonymusRepositoryDelegate.m
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGAnonymusRepositoryDelegate.h"

@implementation NGAnonymusRepositoryDelegate

+ (instancetype)delegateWithAdd:(NGActionBlock)add
                           edit:(NGActionBlock)edit
                         remove:(NGActionBlock)remove
                          event:(NGEventBlock)event {
    NGAnonymusRepositoryDelegate *delegate = [NGAnonymusRepositoryDelegate new];
    
    return delegate;
}

#pragma mark - NGRepositoryDelegate

- (void)repository:(NGRepository *)repository didAdd:(NGRepository *)items {
    
}

- (void)repository:(NGRepository *)repository didEdit:(NGRepository *)items {
    
}

- (void)repository:(NGRepository *)repository didRemove:(NGRepository *)items {
    
}

- (void)repository:(NGRepository *)repository did:(NGEvent *)events {
    
}


@end
