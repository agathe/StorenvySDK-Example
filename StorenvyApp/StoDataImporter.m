//
// Created by Agathe Battestini on 2/20/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StoDataImporter.h"
#import "StvyPublicSDK.h"


@implementation StoDataImporter {

}

static StoDataImporter *_sharedInstance = nil;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_sharedInstance == nil) {
            _sharedInstance = [[self alloc] init];
        }
    });
    return _sharedInstance;
}

+ (void)setSharedInstance:(StoDataImporter *)inSharedInstance {
    NSParameterAssert(inSharedInstance);
    _sharedInstance = inSharedInstance;
}


- (id)init {
    self = [super init];
    if (!self) {
        return  nil;
    }
    self.stvySDKs = [NSMutableDictionary dictionary];
    [self loadStoreDomains];
//    [self loadStvyStoreSDK];
    return self;
}

- (void) loadStoreDomains
{
    self.storeDomains = [@[
            @"lovejunkee",
    ] mutableCopy];
}

- (void) loadStvyStoreSDK
{

//    StvySDK *sdk;
    
//    NSString *storeDomain = [self.storeDomains objectAtIndex:0];
//    for (NSString* storeDomain in self.storeDomains) {
//        NSLog(@"domain %@", storeDomain);
//        sdk = [[StvyPublicSDK alloc] initWithStoreName:storeDomain];
//        [self.stvySDKs setObject:sdk forKey:storeDomain];
//        [StvyPublicSDK setSharedInstance:sdk];
//        NSLog(@"SDK %@ %@", storeDomain, sdk);
//    }

//        self.stvySDKs[storeDomain] = sdk;

//        __weak __typeof(&*self)weakSelf = self;
//        [sdk.api.globalSignal subscribeError:^(NSError *error) {
//            NSLog(@"ERROR %@ SDK API %@: %@",NSStringFromClass([self class]), storeDomain, error);
//        }];
//
//        *stop = YES;

//        [[sdk.api.loadStore deliverOn:RACScheduler.mainThreadScheduler] subscribeNext:^(id x) {
//            NSLog(@"here");
//        }];
//    }];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p>", NSStringFromClass([self class]), self];
}

- (StvySDK *)defaultSDK
{
    return [self.stvySDKs objectForKey:[self.storeDomains objectAtIndex:0]];
}



@end