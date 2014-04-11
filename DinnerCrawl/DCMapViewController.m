//
//  DCMapViewController.m
//  DinnerCrawl
//
//  Created by Rachel Hyman on 4/11/14.
//  Copyright (c) 2014 Rachel Hyman. All rights reserved.
//

#import "DCMapViewController.h"

@interface DCMapViewController ()

@end

@implementation DCMapViewController

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
    self.tileSource = [[RMMapboxSource alloc] initWithMapID:@"rhyman.hope464m"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
