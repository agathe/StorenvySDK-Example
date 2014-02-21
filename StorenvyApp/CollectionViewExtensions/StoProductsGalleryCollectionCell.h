//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StoProductsGalleryCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) StvyEntityPublicCollection *collection;

@end