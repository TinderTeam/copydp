//
//  FEOrderItemTableViewCell.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEOrderItemTableViewCell.h"
#import "FEProductOrder.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation FEOrderItemTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)cancelOrder:(id)sender {
    if ([self.order.order_status isEqualToString:@"已取消"]) {
        if ([self.delegate respondsToSelector:@selector(orderWillDelete:order:)]) {
            [self.delegate orderWillDelete:self order:self.order];
        }
        
    }else if([self.order.order_status isEqualToString:@"已下单"]){
        if ([self.delegate respondsToSelector:@selector(orderWillCancel:order:)]) {
            [self.delegate orderWillCancel:self order:self.order];
        }
    }else if([self.order.order_status isEqualToString:@"已使用"] || [self.order.order_status isEqualToString:@"已过期"]){
        if ([self.delegate respondsToSelector:@selector(orderWillCancel:order:)]) {
            [self.delegate orderWillCancel:self order:self.order];
        }
    }
}

-(void)configWithProduct:(FEProductOrder *)product{
    _order = product;
    self.orderProductDescription.text = product.product_description;
    [self.orderProductImageView sd_setImageWithURL:[NSURL URLWithString:FEShopImageUrlSring(product.imgsrc)]];
    self.orderProductNameLabel.text = product.product_name;
    self.orderProductStatusLabel.text = product.order_status;
    self.orderLimitTimeLabel.text = [product.end_date_time substringToIndex:10];
    self.orderNumberLabel.text = product.order_id;
    self.orderCountLabel.text = [NSString stringWithFormat:@"%@份",product.quantity];
    if ([product.order_status isEqualToString:@"已取消"]) {
        [self.orderOperationButton setTitle:FEString(@"删除订单") forState:UIControlStateNormal];
    }else if([product.order_status isEqualToString:@"已下单"]){
        [self.orderOperationButton setTitle:FEString(@"取消订单") forState:UIControlStateNormal];
    }else if([self.order.order_status isEqualToString:@"已使用"] || [self.order.order_status isEqualToString:@"已过期"]){
        [self.orderOperationButton setTitle:FEString(@"删除订单") forState:UIControlStateNormal];
    }
    
}

@end
