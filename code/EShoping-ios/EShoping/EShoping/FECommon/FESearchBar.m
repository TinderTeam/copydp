//
//  FESearchBar.m
//  EShoping
//
//  Created by Seven on 14-11-21.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FESearchBar.h"

@implementation FESearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        if ([[self subviews] count] > 0)
        {
            UIView * thesuperview = [[self subviews] objectAtIndex:0];
            NSArray *viewSubvies = [thesuperview subviews];
            for (UIView *_theview in viewSubvies)
            {
                if ([_theview isKindOfClass:[UITextField class]])
                {
                    
                }
                if ([_theview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
                {
                    [_theview removeFromSuperview];
                }
            }
        }
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        if ([[self subviews] count] > 0)
        {
            UIView * thesuperview = [[self subviews] objectAtIndex:0];
            NSArray *viewSubvies = [thesuperview subviews];
            for (UIView *_theview in viewSubvies)
            {
                if ([_theview isKindOfClass:[UITextField class]])
                {
                    
                }
                if ([_theview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
                {
                    [_theview removeFromSuperview];
                }
            }
        }
    }
    return self;
}

@end
