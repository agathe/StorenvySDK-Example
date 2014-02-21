//
// Created by Agathe Battestini on 2/20/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StoDataImporter;
@class StoStoreGalleryViewModel;


@interface StoStoreGalleryViewController : UICollectionViewController

@property (nonatomic, strong) StoStoreGalleryViewModel *galleryViewModel;

- (id)init;

@end