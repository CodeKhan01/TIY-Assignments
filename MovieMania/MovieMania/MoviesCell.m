//
//  MoviesCell.m
//  MovieMania
//
//  Created by Isaiah Khan on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "MoviesCell.h"

@implementation MoviesCell

- (void)awakeFromNib
{
    // Initialization code
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    self.backgroundColor = [UIColor blackColor];
    self.textLabel.textColor = [UIColor redColor];
    self.textLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(20.0)];
    self.textLabel.numberOfLines = 3;
    
    self.detailTextLabel.text = @"HELO";
    self.detailTextLabel.textColor = [UIColor redColor];
}

-(void) titleTextLabel:(NSString *)text
{
    
    _labelText = [ [UILabel alloc ] initWithFrame:CGRectMake(0.0, 0.0, (self.bounds.size.width / 2), 43.0) ];
    _labelText.textAlignment = NSTextAlignmentLeft;
    _labelText.textColor = [UIColor cyanColor];
    //_labelText.backgroundColor = [UIColor redColor];
    _labelText.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
    [self addSubview:_labelText];
    _labelText.text = [NSString stringWithFormat: @"%@", text];
}
-(void) detailTextLabel:(NSString *)text
{
    
    _detailLabelText = [ [UILabel alloc ] initWithFrame:CGRectMake(0.0, 43.0, (self.bounds.size.width / 2), 43.0) ];
    _detailLabelText.textAlignment = NSTextAlignmentLeft;
    _detailLabelText.textColor = [UIColor whiteColor];
    //_detailLabelText.backgroundColor = [UIColor redColor];
    _detailLabelText.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
    [self addSubview:_detailLabelText];
    _detailLabelText.text = [NSString stringWithFormat: @"%@", text];
}

-(void)loadImage:(NSString *)ImagePath
{
    NSString *defaultImagePath = @"gravatar.png";
    NSString *path;
    
    if ([ImagePath  isEqual: @""] || [ImagePath  isEqual: @"N/A"] )
    {
        path = defaultImagePath;
        
        UIImage *image = [UIImage imageNamed:path];
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;

        [self.imageView setImage: image];
    }
    else
    {
        path = ImagePath;
        
        NSURL *posterURL = [NSURL URLWithString:path];
        
        NSData *imageData = [NSData dataWithContentsOfURL:posterURL];
        
        UIImage *image = [UIImage imageWithData:imageData];
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;

        [self.imageView setImage: image];
    }
    
    
    
    //self.imageView.image = image;
    
    
}

@end
