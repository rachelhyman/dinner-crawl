//
//  DCMapViewController.m
//  DinnerCrawl
//
//  Created by Rachel Hyman on 4/11/14.
//  Copyright (c) 2014 Rachel Hyman. All rights reserved.
//

#import "DCMapViewController.h"

@interface DCMapViewController ()

@property (nonatomic, strong) UIView *bellaView;

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
    self.mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:self.tileSource];
    self.mapView.delegate = self;
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(38.307181, -82.705078)];
    [self.mapView setZoom:3 animated:YES];
    [self.view addSubview:self.mapView];
    
    RMAnnotation *annotation = [[RMAnnotation alloc] initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(42.335416, -83.049161) andTitle:@"Home"];
    [self.mapView addAnnotation:annotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    RMMapLayer *layer = nil;

        RMMarker *marker = [[RMMarker alloc] initWithMapboxMarkerImage:@"fire-station" tintColor:[UIColor orangeColor]];
        
        marker.canShowCallout = YES;
        
        marker.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bella3.png"]];
        
        marker.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
        layer = marker;
    
    
    return layer;
}

- (void)tapOnCalloutAccessoryControl:(UIControl *)control forAnnotation:(RMAnnotation *)annotation onMap:(RMMapView *)map
{
        self.bellaView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height)];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bella.png"]];
        [self.bellaView addSubview:imageView];
        
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(handleSingleTap:)];
        [self.bellaView addGestureRecognizer:singleFingerTap];
        
        [self.view addSubview:self.bellaView];

}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [self.bellaView removeFromSuperview];
}


@end
