//
//  WXAnation.h
//  MapDemo
//
//  Created by 张岩松 on 14-1-17.
//  Copyright (c) 2014年 张岩松. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface WXAnation : NSObject <MKAnnotation>


@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (id) initWithCoordinate2D: (CLLocationCoordinate2D) coordinate;
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate NS_AVAILABLE(10_9, 4_0);


@end
