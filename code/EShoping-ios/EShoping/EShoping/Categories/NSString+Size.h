//
//  NSString+Size.h
//  EShoping
//
//  Created by Seven on 15-1-18.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)
- (CGSize)boundingRectWithSize:(CGSize)size
                  withTextFont:(UIFont *)font;
@end
