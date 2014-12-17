//
//  FEShopCheckView.h
//  EShoping
//
//  Created by Seven on 14-12-11.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FEShopCheckViewDelegate <NSObject>

@optional
-(void)checkViewDidChange:(NSInteger)count;

@end

@interface FEShopCheckView : UIView
@property (nonatomic, strong) id<FEShopCheckViewDelegate> delegate;
@property (nonatomic, assign) NSInteger number;

@end
