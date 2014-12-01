//
//  FEProductImageTableViewCell.h
//  EShoping
//
//  Created by Seven on 14-11-21.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FEProduct;

@interface FEProductImageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UICollectionView *imageShowCollectionView;
@property (strong, nonatomic) IBOutlet UILabel *saleLabel;
@property (strong, nonatomic) IBOutlet UIPageControl *pageIndicate;
@property (strong, nonatomic, readonly) FEProduct *product;

-(void)configWithProduct:(FEProduct *)product;

@end
