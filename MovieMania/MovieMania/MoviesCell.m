//
//  MoviesCell.m
//  MovieMania
//
//  Created by Isaiah Khan on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "MoviesCell.h"

@implementation MoviesCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadImage:(NSString *)ImagePath
{
    NSString *defaultImagePath = [[NSString alloc ] initWithFormat: @"gravatar.png"];
    
    if ([ImagePath  isEqual: @""] || [ImagePath  isEqual: @"N/A"] )
    {
        [ImagePath copy:defaultImagePath];
    }
    
    NSURL *posterURL = [NSURL URLWithString:ImagePath];
    
    NSData *imageData = [NSData dataWithContentsOfURL:posterURL];
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    //self.imageView.image = image;
    [self.imageView setImage: image];
    
}

@end
