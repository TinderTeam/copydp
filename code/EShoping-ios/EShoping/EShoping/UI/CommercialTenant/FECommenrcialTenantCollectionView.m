//
//  FECommenrcialTenantCollectionView.m
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FECommenrcialTenantCollectionView.h"

@implementation FECommenrcialTenantCollectionView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5);
    
    CGContextSetStrokeColorWithColor(context, FEColor(225, 225, 225, 1).CGColor);
    
    for (int i = 0; i<2; i++) {
        CGContextMoveToPoint(context, self.bounds.size.width / 3.0f * (i+1), 0.0f);
        
        CGContextAddLineToPoint(context, self.bounds.size.width / 3.0f * (i+1), self.bounds.size.height);
        
        CGContextStrokePath(context);
    }
    
    for (int i = 0; i<2; i++) {
        CGContextMoveToPoint(context, 0, self.bounds.size.height / 3.0f * (i+1));
        
        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height / 3.0f * (i+1));
        
        CGContextStrokePath(context);
    }
}


@end
