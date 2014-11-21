//
//  FEProductImageTableViewCell.m
//  EShoping
//
//  Created by Seven on 14-11-21.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductImageTableViewCell.h"
#import "FEProductImageShowCell.h"

@interface FEProductImageTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation FEProductImageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FEProductImageShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopingItemImageShowCell" forIndexPath:indexPath];
    return cell;
}

@end
