//
//  FEGroupCategoryCell.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEGroupCategoryCell.h"
#import "FEShopingGroupCollectionCell.h"

@interface FEGroupCategoryCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation FEGroupCategoryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollectionDataSource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FEShopingGroupCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"groupCategoryCollectionCell" forIndexPath:indexPath];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

@end
