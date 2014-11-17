//
//  FECommonViewController.h
//  SmartHome
//
//  Created by Seven on 14-10-17.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FENavItemDirection) {
	FENavItemLeftDirection,
	FENavItemRightDirection,
};

@interface FECommonViewController : UIViewController

- (void)screenOffset:(CGFloat)offset;

- (void)loadRightCustomButtonItemWithTitle:(NSString *)title image:(UIImage *)image;
-(void)rightbarpressed:(UIButton *)button;

- (UIButton *)loadNavItemWithTitle:(NSString *)title image:(UIImage *)bimage target:(id)target action:(SEL)action direction:(FENavItemDirection)direction;

//about keyboard
- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
- (void)keyboardWillShow:(CGRect)newRect duration:(NSTimeInterval)duration;
- (void)keyboardWillHide:(CGRect)newRect duration:(NSTimeInterval)duration;

@end
