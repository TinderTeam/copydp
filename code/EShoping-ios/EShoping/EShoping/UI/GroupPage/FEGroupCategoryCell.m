//
//  FEGroupCategoryCell.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEGroupCategoryCell.h"
#import "FEShopingGroupCollectionCell.h"

#define __PNG @"png"
#define __TITLE @"title"

@interface FEGroupCategoryCell ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    NSArray *_groupCategoryData;
}

@end

@implementation FEGroupCategoryCell

- (void)awakeFromNib {
    // Initialization code
    _groupCategoryData = @[@{__PNG:@"food_u",__TITLE:FEString(@"餐饮美食")},@{__PNG:@"ktv_u",__TITLE:FEString(@"休闲娱乐")},@{__PNG:@"takeaway_u",__TITLE:FEString(@"汽车服务")},@{__PNG:@"hotel_u",__TITLE:FEString(@"酒店旅游")},@{__PNG:@"marry_u",__TITLE:FEString(@"摄影写真")},@{__PNG:@"discount_u",__TITLE:FEString(@"都市丽人")},@{__PNG:@"booking_u",__TITLE:FEString(@"教育培训")},@{__PNG:@"locate_u",__TITLE:FEString(@"生活服务")}];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollectionDataSource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FEShopingGroupCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"groupCategoryCollectionCell" forIndexPath:indexPath];
    cell.headImageView.image = [UIImage imageNamed:_groupCategoryData[indexPath.row][__PNG]];
    cell.titleLabel.text = _groupCategoryData[indexPath.row][__TITLE];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _groupCategoryData.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

@end
