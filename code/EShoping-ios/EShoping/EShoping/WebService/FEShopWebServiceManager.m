//
//  FEShopWebServiceManager.m
//  EShoping
//
//  Created by Seven on 14-11-21.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#define __SERVICE_BASE_URL @"http://163.125.246.121:7000/copydp/index.php"

#import "FEShopWebServiceManager.h"
#import "FEUserRegistRequest.h"
#import "FEUserRegistResponse.h"
#import "FEUserSigninRequest.h"
#import "FEUserSigninResponse.h"
#import "FEResult.h"

@implementation FEShopWebServiceManager

+(FEShopWebServiceManager *)sharedInstance{
    static FEShopWebServiceManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FEShopWebServiceManager alloc] initWithBaseURL:[NSURL URLWithString:__SERVICE_BASE_URL]];
    });
    return instance;
}

-(instancetype)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}
//regist
-(AFHTTPRequestOperation *)registWithParam:(FEUserRegistRequest *)rdata response:(void (^)(NSError *error, FEUserRegistResponse *response))block{
    return [self postmanager:rdata responseClass:[FEUserRegistResponse class] response:block];
    return [self POST:rdata.method parameters:rdata.dictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        FEUserRegistResponse *rresponse = [[FEUserRegistResponse alloc] initWithResponse:responseObject];
        block(NULL,rresponse);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error,NULL);
        [self showerror:error];
    }];
}

//sign in
-(AFHTTPRequestOperation *)signinWithParam:(FEUserSigninRequest *)rdata response:(void (^)(NSError *error, FEUserSigninResponse *response))block{
    return [self postmanager:rdata responseClass:[FEUserSigninResponse class] response:block];
//    return [self POST:rdata.method parameters:rdata.dictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        FEUserSigninResponse *sresponse = [[FEUserSigninResponse alloc] initWithResponse:responseObject];
//        block(NULL,sresponse);
//        NSLog(@"success!");
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        block(error,NULL);
//    }];
}

-(AFHTTPRequestOperation *)postmanager:(FEBaseRequest *)data responseClass:(Class)class response:(void (^)(NSError *error,  id response))block {
    return [self POST:data.method parameters:data.dictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id response = [[class alloc] initWithResponse:responseObject];
        block(NULL,response);
        NSLog(@"success!");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error,NULL);
    }];
}

-(void)showerror:(NSError *)error{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"EShoping" message:[NSString stringWithFormat:@"%@",error.localizedDescription] delegate:nil cancelButtonTitle:FEString(@"OK") otherButtonTitles:nil];
    [alert show];
}

-(void)showerrorResponse:(FEBaseResponse *)response{
    if (response.result.errorCode.integerValue != 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:[NSString stringWithFormat:@"error code %@",response.result.errorCode] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

@end
