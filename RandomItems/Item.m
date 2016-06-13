//
//  Item.m
//  RandomItems
//
//  Created by Ernald on 5/9/16.
//  Copyright © 2016 Big Nerd. All rights reserved.
//

#import "Item.h"

@implementation Item
+ (instancetype) randomItem
{
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"],
    *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    Item *newItem = [[self alloc] initWithName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
}

- (instancetype) init
{
    return [self initWithName:@"Item"];
}

- (instancetype) initWithName: (NSString *) name
{
    return [self initWithName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype) initWithName: (NSString *) name
               valueInDollars: (int) dollars
                 serialNumber: (NSString *) serialNum
{
    self = [super init];
    
    if(name == nil)
    {
        name = @"";
    }
    
    if(name == nil)
    {
        serialNum = @"";
    }
    
    if(self)
    {
        _itemName = [name copy];
        _valueInDollars = dollars;
        _serialNumber = [serialNum copy];
        
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [self initWithName:[aDecoder decodeObjectForKey:@"itemName"]
                 valueInDollars:[aDecoder decodeInt32ForKey:@"value"]
                 serialNumber:[aDecoder decodeObjectForKey:@"serialNumber"]];
    
    _dateCreated = [aDecoder decodeObjectForKey:@"dateCreated"];
    
    return self;
}

- (void) setContainedItem: (Item *) item
{
    _containedItem = item;
    _containedItem.container = self;
}

- (void) setContainer: (Item *) item
{
    _container = item;
    _container.containedItem = self;
}

- (NSString*) description
{
    return [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                self.itemName,
                self.serialNumber,
                self.valueInDollars,
                self.dateCreated];
}

-(id) copyWithZone:(NSZone *) zone
{
    NSData *containedItemData = [NSKeyedArchiver archivedDataWithRootObject:self];
    return [NSKeyedUnarchiver unarchiveObjectWithData:containedItemData];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.itemName forKey:@"itemName"];
    [aCoder encodeObject:self.serialNumber forKey:@"serialNumber"];
    [aCoder encodeInt:self.valueInDollars forKey:@"value"];
    [aCoder encodeObject:self.dateCreated forKey:@"dateCreated"];
    
    [aCoder encodeObject:self.containedItem forKey:@"containedItem"];
    [aCoder encodeObject:self.container forKey:@"container"];
}

@end
