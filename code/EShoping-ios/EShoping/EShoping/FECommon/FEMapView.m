//
//  FEMapView.m
//  EShoping
//
//  Created by Seven on 14-12-12.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEMapView.h"

@implementation FEMapView


-(void)setPin:(CLLocationCoordinate2D)coord{
    MKCoordinateRegion theRegion;
    MKCoordinateSpan theSpan;
    theSpan.latitudeDelta=0.05;
    theSpan.longitudeDelta=0.05;
    theRegion.span=theSpan;
    theRegion.center = coord;
    [self setRegion:theRegion];
    
    MKPointAnnotation *an = [[MKPointAnnotation alloc] init];
    an.coordinate = coord;
    
    [self addAnnotation:an];
}

@end
