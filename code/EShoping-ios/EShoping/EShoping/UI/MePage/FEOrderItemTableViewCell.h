//
//  FEOrderItemTableViewCell.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FEProductOrder;
@class FEOrderItemTableViewCell;

@protocol FEOrderItemTableViewCellDelegate <NSObject>

@optional
-(void)orderWillCancel:(FEOrderItemTableViewCell *)cell order:(FEProductOrder *)order;
-(void)orderWillDelete:(FEOrderItemTableViewCell *)cell order:(FEProductOrder *)order;


@end

@interface FEOrderItemTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *orderProductImageView;
@property (strong, nonatomic) IBOutlet UILabel *orderProductNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *orderProductDescription;
@property (strong, nonatomic) IBOutlet UILabel *orderProductStatusLabel;
@property (strong, nonatomic) IBOutlet UIButton *orderOperationButton;
@property (strong, nonatomic) FEProductOrder *order;
@property (weak, nonatomic) id<FEOrderItemTableViewCellDelegate> delegate;

-(void)configWithProduct:(FEProductOrder *)product;

@end
