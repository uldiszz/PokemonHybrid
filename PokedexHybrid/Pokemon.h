//
//  Pokemon.h
//  PokedexHybrid
//
//  Created by Uldis Zingis on 02/11/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject

- (instancetype)initWithName:(NSString *)name
                  identifier:(NSInteger)identifier
                   abilities:(NSArray<NSString *> *)abilities
                    NS_DESIGNATED_INITIALIZER;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

@end


@interface Pokemon (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
