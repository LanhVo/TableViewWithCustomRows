//
//  DetailViewController.m
//  TableViewWithCustomCell
//
//  Created by Lanh Vo on 8/4/15.
//  Copyright (c) 2015 batman. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UITextView *desc;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *photos = (NSString *)[self.details.photo objectAtIndex:1];
    NSLog(@"Photos:%@",photos);
    
    self.title = [self.details name];
    [self.photo setImageWithURL:[NSURL URLWithString:photos]
               placeholderImage:[UIImage imageNamed:@"300-300.jpg"]];
    self.desc.text = self.details.desc;

    
    //[self.photo setImageWithURL:[NSURL URLWithString:[self.photoDetail objectAtIndex:1] ]
               //placeholderImage:[UIImage imageNamed:@"300-300.jpg"]];
    //self.desc.text = self.descDetail;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
