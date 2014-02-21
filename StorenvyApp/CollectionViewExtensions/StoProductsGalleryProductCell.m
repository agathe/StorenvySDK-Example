//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StoProductsGalleryProductCell.h"


@implementation StoProductsGalleryProductCell {

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
    self.imageView = imageView;

    self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];

    NSMutableArray *constraints = [@[] mutableCopy];
    NSDictionary *views = @{
            @"image": self.imageView,
            @"label": self.titleLabel};
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[image(145)]-8-[label]-0-|"
                                                                             options:0
                                                                             metrics:nil views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image(145)]-0-|"
                                                                             options:0
                                                                             metrics:nil views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|"
                                                                             options:0
                                                                             metrics:nil views:views]];
    [self.contentView addConstraints:constraints];


    return self;
}



- (void)setProduct:(StvyEntityPublicProduct *)product{
    _product = product;
    self.titleLabel.text = product.name;
    StvyEntityPhoto *photo = [[product.photos allObjects] firstObject];
    [self.imageView setImageWithURL: photo.small];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.imageView.image = nil;
}


@end