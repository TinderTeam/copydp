//
//  FEMapView.h
//  EShoping
//
//  Created by Seven on 14-12-12.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface FEMapView : MKMapView

-(void)setPin:(CLLocationCoordinate2D)coord;

@end
