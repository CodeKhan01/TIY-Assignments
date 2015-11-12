//
//  Movie.m
//  MovieMania
//
//  Created by Isaiah Khan on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Movie.h"

@implementation Movie


-(id)init:(NSString *)title :(NSString *)year :(NSString *)director :(NSString *)runtime :(NSString *)genre :(NSString *)poster :(NSString *)imdbRating
{
    self = [super init];
    if (self)
    {
        _title = [[NSString alloc] initWithString:title];
        _director = [[NSString alloc] initWithString:director];
        _year = [[NSString alloc]initWithString:year];
        _runtime = [[NSString alloc]initWithString:runtime];
        _genre = [[NSString alloc]initWithString:genre];
        _poster = [[NSString alloc]initWithString:poster];
        _imdbRating = [[NSString alloc]initWithString:imdbRating];
    }
    return self;
}



@end
