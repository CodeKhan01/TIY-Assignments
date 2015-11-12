//
//  APIController.m
//  MovieMania
//
//  Created by Isaiah Khan on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "APIController.h"

@implementation APIController

-(id)init//:(APIControllerProtocol *)delegate
{
    self = [super init];
    if (self)
    {
        // _delegator = delegate;

    }
    return self;
}

-(void)searchInOMDBFor:(NSString *)searchTerm
{
    NSString *urlString = [NSString stringWithFormat:@"Pedro, url goes here!",searchTerm];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    
    [dataTask resume];
    
}

-(NSDictionary *)paresJSON:(NSData *)dictionary
{
    
}


@end
