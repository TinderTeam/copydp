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
    
}

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5);
    
    CGContextSetStrokeColorWithColor(context, FEColor(225, 225, 225, 1).CGColor);
    
    CGContextMoveToPoint(context, 0, 0);
    
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    
    //    CGContextSetStrokeColorWithColor(context, FEColor(225, 225, 225, 1).CGColor);
    
    CGContextMoveToPoint(context, 0, self.bounds.size.height - 0.5f);
    
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height - 0.5);
    
    CGContextStrokePath(context);
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

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (height == 667) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }else if(height == 736){
        return UIEdgeInsetsMake(10, 15, 10, 15);
    }else{
        return UIEdgeInsetsMake(10, 5, 10, 5);
    }
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (height == 667) {
        return 2;
    }else if(height == 736){
        return 2;
    }else{
        return 2;
    }
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (height == 667) {
        return 15;
    }else if(height == 736){
        return 28;
    }else{
        return 2;
    }
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
