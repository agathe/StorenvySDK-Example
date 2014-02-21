//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StoProductsGalleryViewModel;


@interface StoProductsGalleryViewController : UICollectionViewController

@property (nonatomic, strong) StoProductsGalleryViewModel *galleryViewModel;

- (id)init;
- (id)initForProductsAndCollections:(BOOL)flag;


@end