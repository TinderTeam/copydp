//
//  FEScanMaskView.m
//  EShoping
//
//  Created by Seven on 15-3-13.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEScanMaskView.h"

@interface FEScanMaskView ()
@property (nonatomic, strong) UIImageView *line;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger number;
@end

@implementation FEScanMaskView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUP];
    }
    return self;
}

-(void)setUP{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 260, 260)];
    imageView.image = [UIImage imageNamed:@"pick_bg"];
    imageView.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    [self addSubview:imageView];
    
    
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 2)];
    _line.image = [UIImage imageNamed:@"line.png"];
    _line.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0 - 110);
    [self addSubview:_line];
    self.number = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
}

-(void)animation1{
    self.number ++;
    _line.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0 - 110 - 40 + 2*self.number);
//    _line.frame = CGRectMake(self.bounds.size.width / 2.0 - 100, self.bounds.size.height / 2.0 - 130 + 2*self.number, 200, 2);
    if (2*self.number >= 220) {
//        upOrdown = YES;
        self.number = 0;
    }
}

-(void)stop{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)dealloc{
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
