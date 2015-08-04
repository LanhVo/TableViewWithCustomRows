//
//  Model.h
//  AFNetworkingTest
//
//  Created by Lanh Vo on 7/28/15.
//  Copyright (c) 2015 Lanh Vo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *bathroom;
@property (strong, nonatomic)NSString *bedroom;
@property (strong, nonatomic)NSString *floor;
@property (strong, nonatomic)NSString *thumbnail;
@property (strong, nonatomic)NSArray *photo;
@property (strong, nonatomic)NSString *desc;

- (id)initWithName:(NSString *)aName
          bathroom:(NSString *)aBathroom
           bedroom:(NSString *)aBedroom
            floor:(NSString *)aFloor
         thumbnail:(NSString *)aThumbnail
             photo:(NSArray *)aPhoto
       description:(NSString *)aDescription;

- (id)initWithDictionary:(NSDictionary *)dic;


@end
