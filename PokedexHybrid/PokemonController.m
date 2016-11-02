//
//  PokemonController.m
//  PokedexHybrid
//
//  Created by Uldis Zingis on 02/11/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import "PokemonController.h"
#import "PokedexHybrid-Swift.h"
#import "Pokemon.h"

static NSString * const baseURLString = @"http://pokeapi.co/api/v2/pokemon/";

@implementation PokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(Pokemon * _Nullable))completion
{
    if (!completion) { completion = ^(Pokemon *p){ }; }

    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];

    [NetworkController performRequestFor:searchURL
                    httpMethodString:@"GET"
                    urlParameters:nil body:nil
                    completion:^(NSData * data, NSError * error) {
        
                        if (error) {
                            NSLog(@"Error getting pokemon for %@: %@", searchTerm, data);
                            completion(nil);
                            return;
                        }
                        
                        NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                        
                        if (!JSONDictionary || ![JSONDictionary isKindOfClass:[NSDictionary class]]) {
                            NSLog(@"Error parsing json dictionary: %@", error);
                            completion(nil);
                            return;
                        }

                        Pokemon *pokemon = [[Pokemon alloc] initWithDictionary:JSONDictionary];
                        completion(pokemon);
    }];
}

@end
