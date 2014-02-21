//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveViewModel/RVMViewModel.h>
#import "StoProductsGalleryViewModel.h"


@interface StoCollectionsProductsViewModel : StoProductsGalleryViewModel

@property (nonatomic, strong) StvyObjectPublicCollections *collections;

@property (nonatomic, readonly) NSInteger collectionCount;

- (StvyEntityPublicCollection *)collectionAtIndex:(NSUInteger)index;

@end