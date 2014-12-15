//
//  FEFuncCollectionViewCell.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEFuncCollectionViewCell.h"
#import "CDCategory.h"

@implementation FEFuncCollectionViewCell

-(void)configWithCategory:(CDCategory *)category{
    _productCategory = category;
    self.funcTitle.text = category.type_name;
}

@end
