//
//  main.m
//  RandomItems
//
//  Created by Ernald on 5/9/16.
//  Copyright © 2016 Big Nerd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for(int i = 0; i < 10; i++)
        {
            [items addObject:[Item randomItem]];
        }
        
        for(Item *item in items)
        {
            NSLog(@"%@", item);
        }
        
        items = nil;
    }
    return 0;
}
