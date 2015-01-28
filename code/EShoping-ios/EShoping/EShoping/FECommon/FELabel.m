//
//  FELabel.m
//  SmartHome
//
//  Created by Seven on 14-10-21.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FELabel.h"

@implementation FELabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // Drawing code
    if (self.drawMidLine) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetLineWidth(context, 0.5);
        
        CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
        
        CGContextMoveToPoint(context, 0, self.bounds.size.height / 2.0);
        
        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height / 2.0);
        
        CGContextStrokePath(context);
    }
    
}


@end
