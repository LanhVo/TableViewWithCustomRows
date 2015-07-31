//
//  Model.m
//  AFNetworkingTest
//
//  Created by Lanh Vo on 7/28/15.
//  Copyright (c) 2015 Lanh Vo. All rights reserved.
//

#import "Model.h"

@implementation Model
//The designated initializer
- (id)initWithName:(NSString *)aName
          bathroom:(NSString *)aBathroom
           bedroom:(NSString *)aBedroom
             floor:(NSString *)aFloor
         thumbnail:(NSString *)aThumbnail
             photo:(NSString *)aPhoto
       description:(NSString *)aDescription {
    self = [super init];
    
    if (self) {
        self.name = aName;
        self.bathroom = aBathroom;
        self.bedroom = aBedroom;
        self.floor = aFloor;
        self.thumbnail = aThumbnail;
        self.photo = aPhoto;
        self.desc = aDescription;
    }
    
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [self initWithName:dic[@"propertyName"] bathroom:dic[@"nbOfBath"] bedroom:dic[@"nbOfBed"] floor:dic[@"nbOfFloor"] thumbnail:dic[@"thumbnail"] photo:dic[@"photos"] description:dic[@"shortDescription"]];
    return self;
}

- (id)init {
    self = [self initWithName:@"Undifined" bathroom:@"Undifined" bedroom:@"Undifined" floor:@"Undifined" thumbnail:@"Undifined" photo:@"Undifined" description:@"Undifined"];
    return self;
}


@end
