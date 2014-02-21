//
// Created by Agathe Battestini on 2/20/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StoDataImporter : NSObject


@property (nonatomic, strong) NSMutableArray *storeDomains;
@property (nonatomic, strong) NSMutableDictionary *stvySDKs;

+ (instancetype)sharedInstance;

+ (void)setSharedInstance:(StoDataImporter *)inSharedInstance;

- (StvySDK *)defaultSDK;

@end