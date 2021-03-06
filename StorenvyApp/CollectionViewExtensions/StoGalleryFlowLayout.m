//
//  StoGalleryFlowLayout.m
//  FRP
//

#import "StoGalleryFlowLayout.h"

@implementation StoGalleryFlowLayout

-(instancetype)init {
    if (!(self = [super init])) return nil;
    
    self.itemSize = CGSizeMake(145, 145);
    self.minimumInteritemSpacing = 10;
    self.minimumLineSpacing = 10;
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.headerReferenceSize = CGSizeMake(320, 44);
    return self;
}

@end
