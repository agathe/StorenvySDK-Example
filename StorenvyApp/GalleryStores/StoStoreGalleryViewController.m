//
// Created by Agathe Battestini on 2/20/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StoStoreGalleryViewController.h"
#import "StoGalleryFlowLayout.h"
#import "UIColor+StoUtils.h"
#import "StoDataImporter.h"
#import "StoStoreGalleryStoreCell.h"
#import "StoStoreGalleryViewModel.h"
#import "StoProductsGalleryViewController.h"


@implementation StoStoreGalleryViewController {

}

- (id)init
{
    StoGalleryFlowLayout *flowLayout = [[StoGalleryFlowLayout alloc] init];

    self = [self initWithCollectionViewLayout:flowLayout];
    if (!self) return nil;

    self.galleryViewModel = [[StoStoreGalleryViewModel alloc] init];
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;

    self.title = @"Storenvy Stores";
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Button"
//                                             style:UIBarButtonItemStylePlain target:nil action:nil];

    self.view.backgroundColor = [UIColor clearColor];
    self.collectionView.backgroundColor = [UIColor randomColor];
    self.collectionView.delegate = self;
    self.collectionView.bounces = YES;
    [self.collectionView registerClass:[StoStoreGalleryStoreCell class]
            forCellWithReuseIdentifier:@"storeCell"];

    @weakify(self);
    [RACObserve(self.galleryViewModel, stores) subscribeNext:^(id x) {
        @strongify(self);
        [self.collectionView reloadData];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"size %@", NSStringFromCGRect(self.view.bounds));

    [StoDataImporter sharedInstance];

    StoGalleryFlowLayout* layout = (StoGalleryFlowLayout*)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(self.view.bounds.size.width - 20.0, 145);
    layout.headerReferenceSize = CGSizeZero;
    [self.collectionView reloadData];


}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.galleryViewModel.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StoStoreGalleryStoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"storeCell"
                                                                               forIndexPath:indexPath];

    StvyEntityPublicStore *store = [self.galleryViewModel.stores objectAtIndex:indexPath.row];
    cell.store = store;

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    StvyEntityPublicStore *product = [self.galleryViewModel.stores objectAtIndex:indexPath.row];

//    FRPFullSizePhotoViewModel *viewModel = [[FRPFullSizePhotoViewModel alloc] initWithPhotoArray:self.viewModel.model
//                                                                               initialPhotoIndex:indexPath.item];

    StoProductsGalleryViewController *viewController = [[StoProductsGalleryViewController alloc]
            initForProductsAndCollections:YES];
//    viewController.viewModel = viewModel;
//    viewController.delegate = (id<StoProductsGalleryViewController>)self;
    [self.navigationController pushViewController:viewController animated:YES];

}


@end