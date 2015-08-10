//
//  MainViewController.m
//  AFNetworkingTest
//
//  Created by Lanh Vo on 7/28/15.
//  Copyright (c) 2015 Lanh Vo. All rights reserved.
//

#import "MainViewController.h"
#import "CustomCell.h"
#import "DetailViewController.h"
#import "KFBaseService.h"
#import "Model.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"
#import "AppDelegate.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *userNamesArray;
@property (nonatomic, strong) NSArray *mobileNumbersArray;
@property (nonatomic, strong)NSArray *data;
@property (nonatomic, strong)NSArray *param;


@end

@implementation MainViewController

@synthesize movies;

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
        
        self.movies = [data valueForKeyPath:@"data.items"];
        NSMutableArray *tempData = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in movies) {
            Model *detail = [[Model alloc] initWithDictionary:dic];
            [tempData addObject:detail];
        }
        self.param = [[NSArray alloc] initWithArray:tempData];
        tempData = nil;
        [self.tableView reloadData];
        
    } failed:^(NSError *error) {
        NSLog(@"Failure!!!%@",error);
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Table"
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

    /* if (self.movies && self.movies.count) {
     return self.movies.count;
     } else {
     return 0;
     } */
    

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
    
    
    CustomCell *controller = [[CustomCell alloc] init];
    
    Model *cellData = self.param[indexPath.row];
    
    [controller setData:cellData returnData:cell];
    
    return cell;
}
    
    
    /* NSDictionary *movie = [self.movies objectAtIndex:indexPath.row];
     
     NSURL *url = [[NSURL alloc] initWithString:[movie objectForKey:@"thumbnail"]];
     [cell.imageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"useravatar"]];
     cell.userNameLabel.text = [movie objectForKey:@"propertyName"];
     NSString *nbOfBath = [NSString stringWithFormat:@"bath: %@  bed: %@  floor: %@",[movie objectForKey:@"nbOfBath"],[movie objectForKey:@"nbOfBed"],[movie objectForKey:@"nbOfFloor"]];
     NSLog(@"Number of Bed:%@", nbOfBath);
     cell.mobileNumberLabel.text = nbOfBath; */
    
   /* NSString *nbOfBath = [NSString stringWithFormat:@"bath: %@  bed: %@  floor: %@",[self.param[indexPath.row] bathroom],[self.param[indexPath.row] bedroom],[self.param[indexPath.row] floor]];
    cell.userNameLabel.text = [self.param[indexPath.row] name];
    cell.mobileNumberLabel.text = nbOfBath;
    NSURL *url = [[NSURL alloc] initWithString:[self.param[indexPath.row] thumbnail]];
    [cell.imageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"useravatar"]]; */
    


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DetailViewController *trailsController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    Model *data = self.param[indexPath.row];
    trailsController.details = data;
    [self.navigationController pushViewController:trailsController animated:NO];
    
}

//NSDictionary *movieDetail = [self.movies objectAtIndex:indexPath.row];
//trailsController.photoDetail = [movieDetail objectForKey:@"photos"];
//trailsController.descDetail = [movieDetail objectForKey:@"description"];
// NSLog(@"Details:%@",trailsController.photoDetail);
// NSLog(@"Description:%@",trailsController.descDetail);


@end
