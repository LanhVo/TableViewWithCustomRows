//
//  CustomCell.m
//  AFNetworkingTest
//
//  Created by Lanh Vo on 7/28/15.
//  Copyright (c) 2015 Lanh Vo. All rights reserved.
//

#import "CustomCell.h"
#import "UIImageView+AFNetworking.h"
#import "MainViewController.h"


@implementation CustomCell

@synthesize userImageView;
@synthesize mobileNumberLabel;
@synthesize userNameLabel;


- (void)setData: (Model*)cell returnData:(CustomCell*)results{
    
    self.cellData = cell;
    results.userNameLabel.text = self.cellData.name;
    
   NSString *nbOfBath = [NSString stringWithFormat:@"bath: %@  bed: %@  floor: %@",self.cellData.bathroom,self.cellData.bedroom,self.cellData.floor];
    results.mobileNumberLabel.text = nbOfBath;
    NSURL *url = [[NSURL alloc] initWithString:[self.cellData thumbnail]];
    [results.userImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"useravatar"]];

}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
