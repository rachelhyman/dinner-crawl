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
            RMMapboxSource *mockSource = [RMMapboxSource mock];
            
            [RMMapboxSource stub:@selector(alloc) andReturn:mockSource];
            expectedSource = [RMMapboxSource mock];
            [mockSource stub:@selector(initWithMapID:) andReturn:expectedSource withArguments:@"rhyman.hope464m"];
            
            mockMapView = [RMMapView mock];
            [RMMapView stub:@selector(alloc) andReturn:mockMapView];
            
            expectedMapView = [RMMapView mock];
            [mockMapView stub:@selector(initWithFrame:andTilesource:) andReturn:expectedMapView];
            
            UIView *mockView = [UIView mock];
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
        
    });
});

SPEC_END