//
//  NGItemSelector.m
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGItemSelector.h"

@implementation NGItemSelector

- (void)enumerate:(NGContext *)context with:(NGAction)action {
    for (NSObject *object in context) {
        NGResult result = self.selectAction(object);
        if (result == NGYes) {
            NGResult subresult = action(object);
            if (subresult == NGBreak) {
                break;
            }
        }
        if (result == NGBreak) {
            break;
        }
    }
}

@end

// koded ;)

// koded ;)

// crafted by Koder www.koder-tools.com
