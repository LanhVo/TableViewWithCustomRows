//
//  CustomCell.m
//  AFNetworkingTest
//
//  Created by Lanh Vo on 7/28/15.
//  Copyright (c) 2015 Lanh Vo. All rights reserved.
//

#import "CustomCell.h"
#import "UIImageView+AFNetworking.h"
@implementation CustomCell




- (void)initwithValue {
    
    NSString *nbOfBath = [NSString stringWithFormat:@"bath: %@  bed: %@  floor: %@",[self.cell bathroom],[self.cell bedroom],[self.cell floor]];
     self.userNameLabel.text = [self.cell name];
    self.mobileNumberLabel.text = nbOfBath;
    NSURL *url = [[NSURL alloc] initWithString:[self.cell thumbnail]];
    [self.userImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"useravatar"]];
    

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
