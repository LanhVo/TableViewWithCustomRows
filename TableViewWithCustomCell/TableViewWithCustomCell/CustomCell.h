//
//  CustomCell.h
//  AFNetworkingTest
//
//  Created by Lanh Vo on 7/28/15.
//  Copyright (c) 2015 Lanh Vo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *mobileNumberLabel;


@property (nonatomic) Model *cellData;

- (void)setData: (Model*)cell returnData:(CustomCell*)results;

@end
