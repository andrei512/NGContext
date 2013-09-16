//
//  NGRepositoryDelegate.h
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NGRepository;
@class NGEvent;

@protocol NGRepositoryDelegate <NSObject>

@required

- (void)repository:(NGRepository *)repository did:(NGEvent *)events;

- (void)repository:(NGRepository *)repository didAdd:(NGRepository *)items;
- (void)repository:(NGRepository *)repository didEdit:(NGRepository *)items;
- (void)repository:(NGRepository *)repository didRemove:(NGRepository *)items;

@end
