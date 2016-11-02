//
//  PokemonController.h
//  PokedexHybrid
//
//  Created by Uldis Zingis on 02/11/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pokemon;

NS_ASSUME_NONNULL_BEGIN

@interface PokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(Pokemon *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
