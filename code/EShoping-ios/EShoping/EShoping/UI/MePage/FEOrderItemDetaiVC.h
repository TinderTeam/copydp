//
//  FEOrderItemDetaiVC.h
//  EShoping
//
//  Created by Seven on 15-1-9.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FETableViewController.h"

@class FEProductOrder;

@protocol FEOrderItemDetaiVCDelegate <NSObject>

@optional
-(void)orderDidCancel:(FEProductOrder *)order;
-(void)orderDidDelete:(FEProductOrder *)order;

@end

@class FEProductOrder;
@interface FEOrderItemDetaiVC : FETableViewController
@property (nonatomic, strong) FEProductOrder *order;
@property (nonatomic, weak) id<FEOrderItemDetaiVCDelegate> delegate;

@end
