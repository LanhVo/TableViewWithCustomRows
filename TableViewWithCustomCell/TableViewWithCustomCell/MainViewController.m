//
//  MainViewController.m
//  AFNetworkingTest
//
//  Created by Lanh Vo on 7/28/15.
//  Copyright (c) 2015 Lanh Vo. All rights reserved.
//

#import "MainViewController.h"
#import "CustomCell.h"
#import "KFBaseService.h"
#import "Model.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *userNamesArray;
@property (nonatomic, strong) NSArray *mobileNumbersArray;
@property (nonatomic, strong)NSArray *data;
@property (nonatomic, strong)NSArray *param;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //[self generateTableViewDataSource];
    [self requestPostUrl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestPostUrl
{
    KFBaseService *service = [[KFBaseService alloc]init];
    NSDictionary *entry = [[NSDictionary alloc]init];
    [service requestWithData:entry url:URL success:^(NSDictionary *data) {
        
        NSArray *jsonArray = [data valueForKeyPath:@"data.items"];
        NSLog(@"Success:%@",[data valueForKeyPath:@"data.items.nbOfFloor"]);
        NSMutableArray *tempData = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in jsonArray) {
            Model *detail = [[Model alloc] initWithDictionary:dic];
            [tempData addObject:detail];
        }
        self.param = [[NSArray alloc] initWithArray:tempData];
        tempData = nil;
       //NSLog(@"Bathroom, Bedroom, Floor: %@",_param);
        
        [self.tableView reloadData];
    } failed:^(NSError *error) {
        NSLog(@"Failure!!!%@",error);
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Ninjas"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.param.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [cellArray lastObject];
    }
    
    [cell.userImageView setImageWithURL:[NSURL URLWithString:[self.param[indexPath.row] thumbnail]]
placeholderImage:[UIImage imageNamed:@"useravatar"]];
    //.image = [UIImage imageNamed:@"useravatar"];
    cell.userNameLabel.text = [self.param[indexPath.row] name];
    //[self.userNamesArray objectAtIndex:indexPath.row];
    //[self.data[indexPath.row] name];
    cell.mobileNumberLabel.text = [self.param[indexPath.row] desc];
    //[self.mobileNumbersArray objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)generateTableViewDataSource{
    self.userNamesArray = @[@"Mohan",@"Phani",@"Narasimha",@"Koti",@"Ramesh",@"Brahmi"];
    self.mobileNumbersArray = @[@"123456",@"125678",@"987542",@"1346789",@"123466",@"1346788"];
    [self.tableView reloadData];
}

@end
