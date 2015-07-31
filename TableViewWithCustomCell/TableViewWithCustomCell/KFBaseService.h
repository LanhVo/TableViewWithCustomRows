//
//  KFBaseService.h
//  Kardio Fit
//
//  Created 1/6/15.
//  Copyright (c) 2015 Tho Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KFBaseManager.h"

typedef void (^success)(id responseData);
typedef void (^failed)(NSError *error);

@interface KFBaseService : KFBaseManager

/*
 *Init conector which an url
 *@Param url : an post method url
 *return : NTUConnector
 */
- (id)initWithURL:(NSString*)url;

/*
 *this method will send data to server when user request something
 *
 *@Param sendData : data send to server , this is a dictionary which have keys is the input params
 * and values are thevalues of all these input params
 *
 *return : void
 */
- (void)requestWithData:(NSDictionary*)params
                    url:(NSString*)url
                success:(void (^)(NSDictionary* data))successBlock
                 failed:(void (^)(NSError* error))failedBlock;


- (void)requestAuthWithData:(NSDictionary*)params
                    url:(NSString*)url
                success:(void (^)(NSDictionary* data))successBlock
                 failed:(void (^)(NSError* error))failedBlock;

- (void)requestGetWithData:(NSDictionary*)params
                       url:(NSString*)url
                   success:(void (^)(NSDictionary* data))successBlock
                    failed:(void (^)(NSError* error))failedBlock;
-(void) uploadAuthWithFileUrl:(NSString*)fileUrl
                          url:(NSString*)url
                      success:(void (^)(NSDictionary* data))successBlock
                       failed:(void (^)(NSError* error))failedBlock;

@end
