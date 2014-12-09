//
//  FEGroupCategoryCell.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEGroupCategoryCell.h"
#import "FEShopingGroupCollectionCell.h"
#import "FECoreDataHandler.h"
#import "AppDelegate.h"
#import "CDCategory.h"

#define __PNG @"png"
#define __TITLE @"title"

@interface FEGroupCategoryCell ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    NSArray *_groupCategoryData;
    NSArray *_categorypng;
}

@end

@implementation FEGroupCategoryCell

- (void)awakeFromNib {
    // Initialization code
    
    NSPredicate *userPredicate = [NSPredicate predicateWithFormat:@"SELF.father_id = %@",@(0)];
    _groupCategoryData = [[FECoreData fetchCategory] filteredArrayUsingPredicate:userPredicate];
    _categorypng = @[@"food_u",@"ktv_u",@"takeaway_u",@"hotel_u",@"marry_u",@"discount_u",@"booking_u",@"locate_u"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollectionDataSource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FEShopingGroupCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"groupCategoryCollectionCell" forIndexPath:indexPath];
    [cell configwithCategory:_groupCategoryData[indexPath.row]];
    cell.headImageView.image = [UIImage imageNamed:_categorypng[indexPath.row]];
//    cell.titleLabel.text = ((CDCategory *)_groupCategoryData[indexPath.row]).type_name;
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _groupCategoryData.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

@end
