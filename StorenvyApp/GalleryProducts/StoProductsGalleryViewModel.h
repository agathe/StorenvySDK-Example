//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveViewModel/RVMViewModel.h>


@interface StoProductsGalleryViewModel : RVMViewModel

@property (nonatomic, strong) StvyObjectPublicProducts *products;

@property (nonatomic, readonly) NSInteger productCount;

@property (nonatomic, readonly) NSInteger numberOfSections;

- (StvyEntityPublicProduct *)productAtIndex:(NSUInteger)index;


@end