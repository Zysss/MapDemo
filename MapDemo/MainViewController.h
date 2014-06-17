//
//  MainViewController.h
//  MapDemo
//
//  Created by 张岩松 on 14-1-17.
//  Copyright (c) 2014年 张岩松. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MainViewController : UIViewController < MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
