//
//  FECommunityTopic.h
//  EShoping
//
//  Created by Seven on 14-12-6.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FECommunityTopic : FEObject
@property (nonatomic, strong, readonly) NSNumber *community_id;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSNumber *discuss_num;
@end
