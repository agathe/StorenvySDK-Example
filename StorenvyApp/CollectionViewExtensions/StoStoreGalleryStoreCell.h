//
// Created by Agathe Battestini on 2/20/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StoStoreGalleryStoreCell : UICollectionViewCell

@property (nonatomic, copy) NSString* domain;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSURL *imageUrl;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) StvyEntityPublicStore *store;

@end