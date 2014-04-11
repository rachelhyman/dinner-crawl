//
//  DCMapViewController.h
//  DinnerCrawl
//
//  Created by Rachel Hyman on 4/11/14.
//  Copyright (c) 2014 Rachel Hyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mapbox.h"

@interface DCMapViewController : UIViewController <RMMapViewDelegate>

@property (nonatomic, strong) RMMapboxSource *tileSource;
@property (nonatomic, strong) RMMapView *mapView; 

@end
