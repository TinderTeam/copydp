//
//  FEProductOrderView.m
//  EShoping
//
//  Created by Seven on 14-11-29.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductOrderView.h"
#import "FEProduct.h"
#import "FEActivity.h"
#import "NSString+DateFromNow.h"

@interface FEProductOrderView ()

@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIButton *orderButton;

@end

@implementation FEProductOrderView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 40)];
        _priceLabel.textColor = FEThemeOrange;
        _priceLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_priceLabel];
        
        _orderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _orderButton.frame = CGRectMake(self.bounds.size.width - 100, 5, 90, 40);
        [_orderButton setBackgroundImage:[UIImage imageFromColor:FEThemeOrange] forState:UIControlStateNormal];
        [_orderButton setTitle:FEString(@"立即抢购") forState:UIControlStateNormal];
        [_orderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _orderButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_orderButton addTarget:self action:@selector(orderPress:) forControlEvents:UIControlEventTouchUpInside];
        _orderButton.layer.cornerRadius = 4;
        _orderButton.layer.masksToBounds = YES;
        [self addSubview:_orderButton];
        
    }
    return self;
}

-(void)orderPress:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(productOrderViewOrderSelect:)]) {
        [self.delegate productOrderViewOrderSelect:self];
    }
}

-(void)configWithProduct:(FEProduct *)product{
    _product = product;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",product.price];
    [self.orderButton setTitle:FEString(@"立即抢购") forState:UIControlStateNormal];
}

-(void)configWithActivity:(FEActivity *)activity{
    _activity = activity;
    self.priceLabel.text = [NSString stringWithFormat:@"剩余%ld天",(long)[activity.datelimit dateFromNow]];
    [self.orderButton setTitle:FEString(@"立即参与") forState:UIControlStateNormal];
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


@end
