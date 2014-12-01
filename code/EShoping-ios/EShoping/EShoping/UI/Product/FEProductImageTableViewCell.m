//
//  FEProductImageTableViewCell.m
//  EShoping
//
//  Created by Seven on 14-11-21.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductImageTableViewCell.h"
#import "FEProductImageShowCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FEProduct.h"

@interface FEProductImageTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation FEProductImageTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    self.pageIndicate.numberOfPages = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configWithProduct:(FEProduct *)product{
    _product = product;
    _imageArray = [NSArray arrayWithObjects:product.imgsrc,product.imgsrc, nil];
    self.pageIndicate.numberOfPages = self.imageArray.count;
    [self.imageShowCollectionView reloadData];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FEProductImageShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopingItemImageShowCell" forIndexPath:indexPath];
    [cell.showImageView sd_setImageWithURL:[NSURL URLWithString:FEShopImageUrlSring(self.imageArray[indexPath.row])]];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.bounds.size.width, self.bounds.size.height);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.imageShowCollectionView) {
        NSInteger page = scrollView.contentOffset.x / scrollView.bounds.size.width;
        self.pageIndicate.currentPage = page;
    }
}


@end
