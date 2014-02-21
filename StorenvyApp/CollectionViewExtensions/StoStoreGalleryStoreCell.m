//
// Created by Agathe Battestini on 2/20/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StoStoreGalleryStoreCell.h"
#import "UIColor+StoUtils.h"

@implementation StoStoreGalleryStoreCell {

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;

    self.backgroundColor = [UIColor whiteColor];


    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:imageView];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.imageView = imageView;

    self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];

    NSMutableArray *constraints = [@[] mutableCopy];
    NSDictionary *views = @{
            @"image": self.imageView,
            @"label": self.titleLabel};
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[image(145)]-8-[label]-0-|"
                                                                             options:0
                                                                             metrics:nil views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image(145)]-0-|"
                                                                             options:0
                                                                             metrics:nil views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|"
                                                                             options:0
                                                                             metrics:nil views:views]];
    [self.contentView addConstraints:constraints];

//    RAC(self.imageView, image) = [[[RACObserve(self, photoModel.thumbnailData) ignore:nil] map:^id(id value) {
//        return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//            [value af_decompressedImageFromJPEGDataWithCallback:
//                    ^(UIImage *decompressedImage) {
//                        [subscriber sendNext:decompressedImage];
//                        [subscriber sendCompleted];
//                    }];
//            return nil;
//        }] subscribeOn:[RACScheduler scheduler]];
//    }] switchToLatest];

    return self;
}


- (void)setDomain:(NSString *)domain {
    _domain = [domain mutableCopy];
    self.titleLabel.text = _domain;
}

- (void)setTitle:(NSString *)title {
    _title = [title mutableCopy];
    self.titleLabel.text = _title;
}

- (void)setStore:(StvyEntityPublicStore *)store {
    _store = store;
    self.titleLabel.text = store.name;
    [self.imageView setImageWithURL:store.avatarUrl];
}


@end