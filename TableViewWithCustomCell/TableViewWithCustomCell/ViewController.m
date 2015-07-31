//
//  ViewController.m
//  CustomCellTutorial
//
//  Created by Musawir Shah on 10/17/13.
//  Copyright (c) 2013 Musawir Shah. All rights reserved.
//

#import "ViewController.h"
#import "KFBaseService.h"
#import "Model.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"


@interface ViewController ()

@property (nonatomic, strong)NSArray *data;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Table View";
    
    [self requestPostUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestPostUrl
{
    KFBaseService *service = [[KFBaseService alloc]init];
    NSDictionary *entry = [[NSDictionary alloc]init];
    [service requestWithData:entry url:URL success:^(NSDictionary *data) {
        
        NSArray *jsonArray = [data valueForKeyPath:@"data.items"];
        NSLog(@"Success:%@",jsonArray);
        NSMutableArray *tempData = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in jsonArray) {
            Model *detail = [[Model alloc] initWithDictionary:dic];
            [tempData addObject:detail];
        }
        
        
        self.data = [[NSArray alloc] initWithArray:tempData];
        tempData = nil;
        
        //[self.tableViewObject reloadData];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
    NSLog(@"Number of rows:%lu", (unsigned long)[self.data count]);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCustomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"MyCustomCell" bundle:nil] forCellReuseIdentifier:@"myCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(MyCustomCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.middleLabel.text = [self.data[indexPath.row] name];
}


@end
