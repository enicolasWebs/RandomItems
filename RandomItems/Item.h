//
//  Item.h
//  RandomItems
//
//  Created by Ernald on 5/9/16.
//  Copyright © 2016 Big Nerd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, copy) NSDate *dateCreated;

@property (nonatomic, strong) Item *containedItem;
@property (nonatomic, weak) Item *container;

+(instancetype) randomItem;

- (instancetype) initWithName: (NSString *) name
               valueInDollars: (int) dollars
                 serialNumber: (NSString *) serialNum;
- (instancetype) initWithName: (NSString *) name;

-(id) copyWithZone:(NSZone *) zone;
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (void) setContainedItem: (Item *) item;
- (void) setContainer: (Item *) item;
@end