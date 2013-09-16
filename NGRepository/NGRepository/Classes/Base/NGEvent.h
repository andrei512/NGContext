//
//  NGEvent.h
//  NGRepository
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGItemSelector.h"

@interface NGEvent : NSObject

@property (nonatomic, strong) NGItemSelector *itemSelector;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDictionary *eventInfo;

+ (instancetype)eventNamed:(NSString *)name
                   onItems:(id)items
                   andInfo:(NSDictionary *)eventInfo;

+ (instancetype)eventNamed:(NSString *)name
                   onItems:(id)items;

+ (instancetype)eventNamed:(NSString *)name;


@end
