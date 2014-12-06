//
//  FECommunityCreateTopicRequest.h
//  EShoping
//
//  Created by Seven on 14-12-6.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FECommunityCreateTopicRequest : FEBaseRequest

@property (nonatomic, strong, readonly) NSString *communityType;		//总共可传递4种类型，“全部分类”、“房介信息”、“应聘信息”、“招聘信息”
@property (nonatomic, strong, readonly) NSNumber *userID;				//创建者ID
@property (nonatomic, strong, readonly) NSString *context;			//帖子内容
@property (nonatomic, strong, readonly) NSString *title;				//帖子标题

@end
