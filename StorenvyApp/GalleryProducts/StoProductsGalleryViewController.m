//
// Created by Agathe Battestini on 2/21/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StoProductsGalleryViewController.h"
#import "StoGalleryFlowLayout.h"
#import "UIColor+StoUtils.h"
#import "StoProductsGalleryViewModel.h"
#import "StoProductsGalleryProductCell.h"
#import "StoCollectionsProductsViewModel.h"
#import "StoProductsGalleryCollectionCell.h"


@implementation StoProductsGalleryViewController {

}

- (id)init
{
    return [self initForProductsAndCollections:NO];
}

- (id)initForProductsAndCollections:(BOOL)flag
{
    StoGalleryFlowLayout *flowLayout = [[StoGalleryFlowLayout alloc] init];

    self = [self initWithCollectionViewLayout:flowLayout];
    if (!self) return nil;

    if(!flag)
        self.galleryViewModel = [[StoProductsGalleryViewModel alloc] init];
    else{
        self.galleryViewModel = [[StoCollectionsProductsViewModel alloc] init];
    }
    return self;

}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;

    RAC(self, title) = [[[[StvyPublicSDK.api.loadStore logError] map:^id(StvyAPIResponse *response) {
        StvyEntityPublicStore *store = response.resultObject;
        return store.name;
    }] publish] autoconnect];
    self.title = @"Store";
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Button"
//                                             style:UIBarButtonItemStylePlain target:nil action:nil];

    self.view.backgroundColor = [UIColor clearColor];
    self.collectionView.backgroundColor = [UIColor randomColor];
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[StoProductsGalleryProductCell class]
            forCellWithReuseIdentifier:@"storeCell"];

    [self.collectionView registerClass:[StoProductsGalleryCollectionCell class]
            forCellWithReuseIdentifier:@"collectionCell"];

    [self.collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];


    @weakify(self);
    [RACObserve(self.galleryViewModel, products) subscribeNext:^(id x) {
        @strongify(self);
        [self.collectionView reloadData];
    }];

    if(self.galleryViewModel.numberOfSections==2){
        StoCollectionsProductsViewModel *cpModel = (StoCollectionsProductsViewModel *) self.galleryViewModel;
        [RACObserve(cpModel, collections) subscribeNext:^(id x) {
            @strongify(self);
            [self.collectionView reloadData];
        }];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    StoGalleryFlowLayout* layout = (StoGalleryFlowLayout*)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(self.view.bounds.size.width - 20.0, 145);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"size %@", NSStringFromCGRect(self.view.bounds));

    StoGalleryFlowLayout* layout = (StoGalleryFlowLayout*)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(self.view.bounds.size.width - 20.0, 145);
    [self.collectionView reloadData];


}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.galleryViewModel.numberOfSections;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(self.galleryViewModel.numberOfSections==1){
        return self.galleryViewModel.productCount;
    }
    else{
        switch (section){
            case 1:
                return self.galleryViewModel.productCount;
            case 0:
                return [(StoCollectionsProductsViewModel*)self.galleryViewModel collectionCount];
        }

    }
    return 0;
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *resultCell;
    if(indexPath.section == 1 || self.galleryViewModel.numberOfSections==0){
        StoProductsGalleryProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"storeCell"
                                                                                        forIndexPath:indexPath];

        StvyEntityPublicProduct *product = [self.galleryViewModel productAtIndex:indexPath.row];
        cell.product = product;
        resultCell = cell;
    }
    else{
        StoProductsGalleryCollectionCell *cell = [collectionView
                dequeueReusableCellWithReuseIdentifier:@"collectionCell"
                                                                                           forIndexPath:indexPath];
        StvyEntityPublicCollection *collection = [(StoCollectionsProductsViewModel *)self.galleryViewModel
                collectionAtIndex:indexPath.row];
        cell.collection = collection;
        resultCell = cell;
    }

    return resultCell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
//    return self.galleryViewModel.numberOfSections == 2 && indexPath.section==0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    StvyEntityPublicStore *product = [self.galleryViewModel.stores objectAtIndex:indexPath.row];
//
////    FRPFullSizePhotoViewModel *viewModel = [[FRPFullSizePhotoViewModel alloc] initWithPhotoArray:self.viewModel.model
////                                                                               initialPhotoIndex:indexPath.item];
//
//    StoProductsGalleryViewController *viewController = [[StoProductsGalleryViewController alloc]
//            initForProductsAndCollections:YES];
////    viewController.viewModel = viewModel;
////    viewController.delegate = (id<StoProductsGalleryViewController>)self;
//    [self.navigationController pushViewController:viewController animated:YES];


}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {

        UICollectionReusableView *reusableview = [collectionView
                dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                   withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];

        if (reusableview==nil) {
            reusableview=[[UICollectionReusableView alloc] initWithFrame:CGRectMake(20, 0, 300, 40)];

        }
        UILabel *label = (UILabel*)[reusableview viewWithTag:9876];
        if(!label){
            CGRect frame = reusableview.bounds;
            frame.origin.x += 20;
            frame.size.width -= 40;
            frame.origin.y += 8;
            UILabel *label=[[UILabel alloc] initWithFrame:frame];
            label.tag = 9876;
            [reusableview addSubview:label];

        }
        if(self.galleryViewModel.numberOfSections==1)
            label.text = @"Products";
        else{
            if (indexPath.section == 0)
                label.text = @"Collections";
            else
                label.text = @"Products";
        }
        return reusableview;
    }
    return nil;
}
@end