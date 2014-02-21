//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StoStoreGalleryViewModel.h"
#import "StoDataImporter.h"


@implementation StoStoreGalleryViewModel {

}

-(instancetype)init {
    self = [super init];
    if (!self) return nil;

    self.domainNames = [[StoDataImporter sharedInstance] storeDomains];
    RAC(self, stores) = [self fetchStores];

    return self;
}

-(RACSignal *)fetchStores {
    return [[[[StvyPublicSDK.api.loadStore logError] map:^id(StvyAPIResponse *response) {
        return @[response.resultObject];
    }] publish] autoconnect];
//    return [[StvyPublicSDK.api.loadStore logError] catchTo:[RACSignal empty]];
}

- (NSUInteger)count {
    return self.stores.count;
}

@end