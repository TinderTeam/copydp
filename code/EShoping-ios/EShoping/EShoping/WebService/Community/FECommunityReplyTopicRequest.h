//
//  FECommunityReplyTopicRequest.h
//  EShoping
//
//  Created by Seven on 14-12-6.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FECommunityReplyTopicRequest : FEBaseRequest

@property (nonatomic, strong, readonly) NSNumber *community_id;		//帖子ID
@property (nonatomic, strong, readonly) NSNumber *userID;			//回帖人ID
@property (nonatomic, strong, readonly) NSString *content;		//回帖内容

@end
