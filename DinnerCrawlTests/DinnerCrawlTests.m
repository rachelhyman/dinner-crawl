//
//  DinnerCrawlTests.m
//  DinnerCrawlTests
//
//  Created by Rachel Hyman on 4/11/14.
//  Copyright (c) 2014 Rachel Hyman. All rights reserved.
//

#import "Kiwi.h"
#import "DCMapViewController.h"
#import "Mapbox.h"

SPEC_BEGIN(DCMapViewControllerTest)

describe(@"DCMapViewController", ^{
    __block DCMapViewController *mapViewController;
    
    beforeEach(^{
        mapViewController = [[DCMapViewController alloc] init];
    });
    
    it(@"DCMapViewController exists", ^{
        [[mapViewController shouldNot] beNil];
    });
    
    describe(@"#viewDidLoad", ^{
        __block RMMapboxSource *expectedSource;
        __block RMMapView *mockMapView;
        __block RMMapView *expectedMapView;
        
        beforeEach(^{
            RMMapboxSource *mockSource = [RMMapboxSource nullMock];
            
            [RMMapboxSource stub:@selector(alloc) andReturn:mockSource];
            expectedSource = [RMMapboxSource nullMock];
            [mockSource stub:@selector(initWithMapID:) andReturn:expectedSource withArguments:@"rhyman.hope464m"];
            
            mockMapView = [RMMapView nullMock];
            [RMMapView stub:@selector(alloc) andReturn:mockMapView];
            
            expectedMapView = [RMMapView nullMock];
            [mockMapView stub:@selector(initWithFrame:andTilesource:) andReturn:expectedMapView];
            
            UIView *mockView = [UIView nullMock];
            [mapViewController stub:@selector(view) andReturn:mockView];
            [mockView stub:@selector(bounds)];
            [mockView stub:@selector(addSubview:)];
        });
        
        it(@"creates a tile source from our desired id", ^{
            [mapViewController viewDidLoad];

            [[mapViewController.tileSource should] equal:expectedSource];
        });
        
        it(@"creates a map view with the tile source", ^{
            [mapViewController viewDidLoad];
            
            [[mapViewController.mapView should] equal:expectedMapView];
            
        });
        
        it(@"adds subview of map", ^{
            [[mapViewController.view should] receive:@selector(addSubview:) withArguments:expectedMapView];
            
            [mapViewController viewDidLoad];
            
        });
        
        it(@"sets the correct center coordinate", ^{
            CLLocationCoordinate2D center = CLLocationCoordinate2DMake(38.307181, -82.705078);
            [[expectedMapView should] receive:@selector(setCenterCoordinate:) withArguments:theValue(center)];
            [mapViewController viewDidLoad];
        });
        
    });
});

SPEC_END