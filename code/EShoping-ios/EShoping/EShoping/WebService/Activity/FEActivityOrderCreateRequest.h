//
//  FEActivityOrderCreateRequest.h
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEActivityOrderCreateRequest : FEBaseRequest
@property (nonatomic, strong, readonly) NSNumber *userID;					//产生订单的用户ID
@property (nonatomic, strong, readonly) NSNumber *activityID;				//产生订单的活动ID
-(id)initWithUserID:(NSInteger)uid activityID:(NSInteger)aid;

@end
