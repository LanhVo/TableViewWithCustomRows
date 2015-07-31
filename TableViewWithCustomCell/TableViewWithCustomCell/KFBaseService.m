//
//  KFBaseService.m
//  Kardio Fit
//
//  Created 1/6/15.
//  Copyright (c) 2015 Tho Nguyen. All rights reserved.
//

#import "KFBaseService.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"

@interface KFBaseService()





@end

@implementation KFBaseService


#pragma mark - init section
- (id)initWithURL:(NSString*)url
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

#pragma mark - send section

- (void)requestWithData:(NSDictionary*)params
                    url:(NSString*)url
                success:(void (^)(NSDictionary* data))successBlock
                 failed:(void (^)(NSError* error))failedBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failedBlock(error);
    }];
  
}

- (void)requestGetWithData:(NSDictionary*)params
                    url:(NSString*)url
                success:(void (^)(NSDictionary* data))successBlock
                 failed:(void (^)(NSError* error))failedBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success:%@", responseObject);
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"fail:%@", error);
         failedBlock(error);
    }];
    
   
}



- (void)requestAuthWithData:(NSDictionary*)params
                        url:(NSString*)url
                    success:(void (^)(NSDictionary* data))successBlock
                     failed:(void (^)(NSError* error))failedBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failedBlock(error);
    }];

    
    
}

-(void) uploadAuthWithFileUrl:(NSString*)fileUrl
                          url:(NSString*)url
                      success:(void (^)(NSDictionary* data))successBlock
                       failed:(void (^)(NSError* error))failedBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"foo": @"bar"};
    NSURL *filePath = [NSURL fileURLWithPath:fileUrl];
    [manager POST:url  parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:filePath name:@"image" error:nil];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failedBlock(error);
    }];
}

@end
