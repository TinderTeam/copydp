//
//  FEShopingItemCell.h
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FEProduct;

@interface FEShopingItemCell : UITableViewCell

-(void)configWithProduct:(FEProduct *)product;

@end
