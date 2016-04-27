//
//  TourViewController.m
//  TourLogin
//
//  Created by Leonardo Arrata Donadel on 4/26/16.
//  Copyright © 2016 Leonardo Arrata Donadel. All rights reserved.
//

#import "TourViewController.h"
#import "NFXIntroViewController.h"

@interface TourViewController ()

@end

@implementation TourViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
  
    
    UIImage*tour1 = [UIImage imageNamed:@"tour-1"];
    UIImage*tour2 = [UIImage imageNamed:@"tour-2"];
    UIImage*tour3 = [UIImage imageNamed:@"tour-3"];
    UIImage*tour4 = [UIImage imageNamed:@"tour-4"];
    UIImage*tour5 = [UIImage imageNamed:@"tour-5"];
    UIImage*tour6 = [UIImage imageNamed:@"tour-6"];
    
    NFXIntroViewController*tourVC = [[NFXIntroViewController alloc] initWithViews:@[tour1,tour2,tour3,tour4,tour5,tour6]];
    [self presentViewController:tourVC animated:true completion:nil];
    
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
