//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StoCollectionsProductsViewModel.h"


@implementation StoCollectionsProductsViewModel {

}

-(instancetype)init {
    self = [super init];
    if (!self) return nil;

    RAC(self, collections) = [self fetchCollections];

    return self;
}

-(RACSignal *)fetchCollections {
    return [[[[StvyPublicSDK.api.loadCollections logError] map:^id(StvyAPIResponse *response) {
        return response.resultObject;
    }] publish] autoconnect];
}

- (NSInteger)collectionCount{
    return self.collections.items.count;
}

- (NSInteger)numberOfSections {
    return 2;
}


- (StvyEntityPublicCollection *)collectionAtIndex:(NSUInteger)index {
    if(index < self.collectionCount)
        return [[self.collections.items allObjects] objectAtIndex:index];
    return nil;
}


@end