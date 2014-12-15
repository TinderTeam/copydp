//
//  FEProductOrderView.h
//  EShoping
//
//  Created by Seven on 14-11-29.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FEProductOrderView;
@class FEProduct;
@class FEActivity;

@protocol FEProductOrderViewDelegate <NSObject>

@optional
-(void)productOrderViewOrderSelect:(FEProductOrderView *)oview;

@end

@interface FEProductOrderView : UIView
@property (nonatomic, strong, readonly) FEProduct *product;
@property (nonatomic, strong, readonly) FEActivity *activity;
@property (weak, nonatomic) id<FEProductOrderViewDelegate> delegate;


-(void)configWithProduct:(FEProduct *)product;
-(void)configWithActivity:(FEActivity *)activity;
@end
