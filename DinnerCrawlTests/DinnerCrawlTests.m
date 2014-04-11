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
        it(@"sets up the MapBox tile source", ^{
            
            [mapViewController viewDidLoad];
            
            [[mapViewController.tileSource shouldNot] beNil];
        });
        
        it(@"creates a tile source from our desired id", ^{
            
            RMMapboxSource *mockSource = [RMMapboxSource mock];

            [RMMapboxSource stub:@selector(alloc) andReturn:mockSource];
            RMMapboxSource *expectedSource = [[RMMapboxSource alloc] init];
            [mockSource stub:@selector(initWithMapID:) andReturn:expectedSource withArguments:@"rhyman.hope464m"];
            
            [mapViewController viewDidLoad];
            
            [[mapViewController.tileSource should] equal:expectedSource];
        });
        
        
    });
});

SPEC_END