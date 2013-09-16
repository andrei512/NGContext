//
//  NGAnonymusRepositoryDelegate.h
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGRepository.h"

@interface NGAnonymusRepositoryDelegate : NSObject <NGRepositoryDelegate>

@property (nonatomic, copy) NGActionBlock onAdd;
@property (nonatomic, copy) NGActionBlock onEdit;
@property (nonatomic, copy) NGActionBlock onRemove;

@property (nonatomic, copy) NGEventBlock onEvent;

+ (instancetype)delegateWithAdd:(NGActionBlock)add
                           edit:(NGActionBlock)edit
                         remove:(NGActionBlock)remove
                          event:(NGEventBlock)event;


@end
