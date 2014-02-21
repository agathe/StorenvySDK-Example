//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveViewModel/ReactiveViewModel.h>

@interface StoStoreGalleryViewModel : RVMViewModel

@property (nonatomic, strong) NSArray *domainNames;

@property (nonatomic, strong) NSArray *stores;

@property (nonatomic, readonly) NSUInteger count;
@end