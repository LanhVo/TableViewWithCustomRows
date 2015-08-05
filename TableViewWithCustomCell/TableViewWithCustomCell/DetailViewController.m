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
{
    NSMutableArray *mutArrImages;
    NSInteger intCurrentImage;
    NSTimer *timerAnimation;
}
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UITextView *desc;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view from its nib.

    self.title = [self.details name];
    self.desc.text = self.details.desc;
    
    //NSString *photos = (NSString *)[self.details.photo objectAtIndex:1];
    //NSLog(@"Photos:%@",photos);
    //[self.photo setImageWithURL:[NSURL URLWithString:photos] placeholderImage:[UIImage imageNamed:@"300-300.jpg"]];
    
    mutArrImages = [[NSMutableArray alloc] init];
    for (int i = 1; i <self.details.photo.count ; i++) {
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString: [self.details.photo objectAtIndex:i]]];
    UIImage *imgOne = [UIImage imageWithData:imageData];
        if (imgOne) {
            [mutArrImages addObject:imgOne];
        }
    }
    
    intCurrentImage = 0;
    [self.photo setImage:[mutArrImages objectAtIndex:intCurrentImage]];
    
    timerAnimation = [NSTimer scheduledTimerWithTimeInterval:4.0
                                                      target:self
                                                    selector:@selector(animatePhotoSlideShow)
                                                    userInfo:nil
                                                     repeats:YES];


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)animatePhotoSlideShow {
    
    if (intCurrentImage == [mutArrImages count]-1 && [timerAnimation isValid]) {
        [timerAnimation invalidate];
        timerAnimation = nil;
        return;
    }
    intCurrentImage += 1;
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush; //Animation Types: kCATransitionFade, kCATransitionFromLeft, kCATransitionReveal, kCATransitionFromBottom
    transition.duration = 2;
    
    [self.photo.layer addAnimation:transition forKey:nil];
    [self.photo setImage:[mutArrImages objectAtIndex:intCurrentImage]];
}


@end
