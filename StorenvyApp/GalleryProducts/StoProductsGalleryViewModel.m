//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StoProductsGalleryViewModel.h"


@implementation StoProductsGalleryViewModel {

}

-(instancetype)init {
    self = [super init];
    if (!self) return nil;

    RAC(self, products) = [self fetchProducts];

    return self;
}

-(RACSignal *)fetchProducts {
    return [[[[StvyPublicSDK.api.loadProducts logError] map:^id(StvyAPIResponse *response) {
        return response.resultObject;
    }] publish] autoconnect];
}

- (NSInteger)productCount {
    return self.products.items.count;
}

- (NSInteger)numberOfSections {
    return 1;
}

- (StvyEntityPublicProduct *)productAtIndex:(NSUInteger)index {
    if(index < self.productCount)
        return [self.products.items objectAtIndex:index];
    return nil;
}



@end