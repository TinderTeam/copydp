//
//  FESiginVC.h
//  EShoping
//
//  Created by Seven on 14-11-19.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECommonViewController.h"

@protocol FESigninVCDelegate <NSObject>

@optional
-(void)signinVCDidSignin:(BOOL)isSignin;

@end

@interface FESiginVC : FECommonViewController

@property (nonatomic, weak) id<FESigninVCDelegate> delegate;

@end
