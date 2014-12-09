//
//  FEShopingFuncCell.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopingFuncCell.h"
#import "FEFuncCollectionViewCell.h"

#define __PNG @"png"
#define __TITLE @"title"

@interface FEShopingFuncCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSArray *_categoryData;
    NSArray *_categorypng;
}

@end

@implementation FEShopingFuncCell

- (void)awakeFromNib {
    // Initialization code
    self.pageIndicate.numberOfPages = 0;
    
    NSPredicate *userPredicate = [NSPredicate predicateWithFormat:@"SELF.father_id = %@",@(0)];
    _categoryData = [[FECoreData fetchCategory] filteredArrayUsingPredicate:userPredicate];
    _categorypng = @[@"food_u",@"ktv_u",@"takeaway_u",@"hotel_u",@"marry_u",@"discount_u",@"booking_u",@"locate_u"];
    
//    _categoryData = @[@{__PNG:@"food_u",__TITLE:FEString(@"餐饮美食")},@{__PNG:@"ktv_u",__TITLE:FEString(@"休闲娱乐")},@{__PNG:@"takeaway_u",__TITLE:FEString(@"汽车服务")},@{__PNG:@"hotel_u",__TITLE:FEString(@"酒店旅游")},@{__PNG:@"marry_u",__TITLE:FEString(@"摄影写真")},@{__PNG:@"discount_u",__TITLE:FEString(@"都市丽人")},@{__PNG:@"booking_u",__TITLE:FEString(@"教育培训")},@{__PNG:@"locate_u",__TITLE:FEString(@"生活服务")}];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _categoryData.count;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FEFuncCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopingTypeCell" forIndexPath:indexPath];
    [cell configWithCategory:_categoryData[indexPath.row]];
//    cell.funcTitle.text = _categoryData[indexPath.row][__TITLE];
    cell.funcIcon.image = [UIImage imageNamed:_categorypng[indexPath.row]];
    return cell;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.categoryCollectionView) {
        self.pageIndicate.currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
    }
}


@end
