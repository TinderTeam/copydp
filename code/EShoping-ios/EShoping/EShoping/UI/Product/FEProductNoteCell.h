//
//  FEProductNoteCell.h
//  EShoping
//
//  Created by Seven on 14-12-14.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FEProduct;

@interface FEProductNoteCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *limitTimeLabel;

-(void)configWithProduct:(FEProduct *)product;

@end
