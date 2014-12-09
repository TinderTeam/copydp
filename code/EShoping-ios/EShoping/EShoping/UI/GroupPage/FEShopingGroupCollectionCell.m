//
//  FEShopingGroupCollectionCell.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopingGroupCollectionCell.h"
#import "CDCategory.h"

@implementation FEShopingGroupCollectionCell

-(void)configwithCategory:(CDCategory *)category{
    _productcategory = category;
    _titleLabel.text = category.type_name;
}

@end
