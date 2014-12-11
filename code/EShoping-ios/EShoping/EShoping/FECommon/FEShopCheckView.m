//
//  FEShopCheckView.m
//  EShoping
//
//  Created by Seven on 14-12-11.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopCheckView.h"

@interface FEShopCheckView ()
@property (nonatomic, strong) UIButton *minusButton;
@property (nonatomic, strong) UIButton *plusButton;
@property (nonatomic, strong) UITextField *numberTextFeild;

@end

@implementation FEShopCheckView

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    _minusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_minusButton setTitle:@"-" forState:UIControlStateNormal];
    [_minusButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    _minusButton.frame = CGRectMake(2, 2, 30, 30);
    [self addSubview:_minusButton];
    
    _numberTextFeild = [[UITextField alloc] initWithFrame:CGRectMake(_minusButton.frame.origin.x + _minusButton.bounds.size.width + 5, 2, 60, 30)];
    _numberTextFeild.layer.borderColor = [UIColor grayColor].CGColor;
    _numberTextFeild.layer.borderWidth = 0.5;
    _numberTextFeild.layer.cornerRadius = 2;
    _numberTextFeild.layer.masksToBounds = YES;
    _numberTextFeild.keyboardType = UIKeyboardTypeNumberPad;
    _numberTextFeild.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_numberTextFeild];
    
    _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _plusButton.frame = CGRectMake(_numberTextFeild.frame.origin.x + _numberTextFeild.bounds.size.width + 5, 2, 30, 30);
    [_plusButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_plusButton setTitle:@"+" forState:UIControlStateNormal];
    [self addSubview:_plusButton];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
