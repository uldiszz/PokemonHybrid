//
//  Pokemon.m
//  PokedexHybrid
//
//  Created by Uldis Zingis on 02/11/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

- (instancetype)init
{
    return [self initWithName:@"" identifier:0 abilities:@[]];
}

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _identifier = identifier;
        _abilities = [abilities copy];
    }
    return self;
}

@end

@implementation Pokemon (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    
    NSArray *abilityDictionariesArray = dictionary[@"abilities"];
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in abilityDictionariesArray) {
        NSDictionary<NSString *, id> *abilityDictionary = dictionary[@"ability"];
        NSString *abilityName = abilityDictionary[@"name"];
        if (!abilityName) { continue; }
        [abilities addObject:abilityName];
    }
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
