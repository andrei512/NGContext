NGContext
============

Next Generation Container


## NGList

``` objective-c
    NGList *list = [NGList list];

    [list on:@"add, remove" do:^(NGEvent *event) {
        NSLog(@"%@", event);
    }];
    
    for (int i = 0; i < 100; ++i) {
        [list addObject:@(i)];
    }
    
    [list removeObject:@33];
```

```
2013-09-17 01:35:09.924 NGContext[43194:c07] Event name: add info: {
    object = 0;
}
2013-09-17 01:35:09.926 NGContext[43194:c07] Event name: add info: {
    object = 1;
}
2013-09-17 01:35:09.927 NGContext[43194:c07] Event name: add info: {
    object = 2;
}
2013-09-17 01:35:09.928 NGContext[43194:c07] Event name: add info: {
    object = 3;
}

...

2013-09-17 01:35:10.060 NGContext[43194:c07] Event name: add info: {
    object = 98;
}
2013-09-17 01:35:10.061 NGContext[43194:c07] Event name: add info: {
    object = 99;
}
2013-09-17 01:35:10.061 NGContext[43194:c07] Event name: remove info: {
    object = 33;
}
```
