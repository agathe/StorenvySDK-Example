//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StoProductsGalleryCollectionCell.h"


@implementation StoProductsGalleryCollectionCell {

}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;

    self.backgroundColor = [UIColor whiteColor];


    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:imageView];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.contentView.clipsToBounds = YES;
    self.imageView = imageView;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;

    self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0
                                                      alpha:0.7];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];

    NSMutableArray *constraints = [@[] mutableCopy];
    NSDictionary *views = @{
            @"image": self.imageView,
            @"label": self.titleLabel};
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[image]-0-|"
                                                                             options:0
                                                                             metrics:nil views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[label]-0-|"
                                                                             options:0
                                                                             metrics:nil views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]"
                                                                             options:0
                                                                             metrics:nil views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|"
                                                                             options:0
                                                                             metrics:nil views:views]];
    [self.contentView addConstraints:constraints];


    return self;
}


- (void)setCollection:(StvyEntityPublicCollection *)collection {
    _collection = collection;
    self.titleLabel.text = [NSString stringWithFormat:@"Collection: %@",collection.name];
    [self.imageView setImageWithURL: collection.photoUrl];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.imageView.image = nil;
}


@end