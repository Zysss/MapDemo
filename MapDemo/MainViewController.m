//
//  MainViewController.m
//  MapDemo
//
//  Created by 张岩松 on 14-1-17.
//  Copyright (c) 2014年 张岩松. All rights reserved.
//

#import "MainViewController.h"
#import "WXAnation.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
    //是否显示当前是设备位置
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    //地图的显示类型
    /*
     *MKMapTypeStandard 标准地图
     *MKMApTypeSatellite 卫星地图
     *MKMapTypeHybrid 混合地图
     */
    self.mapView.mapType = MKMapTypeStandard;
    
    //坐标，这是地图初始化的时候显示的坐标。
    CLLocationCoordinate2D coord = {39.92,116.46};
    //显示的返回，数值越大，范围就越大
    MKCoordinateSpan span = {0.1,0.1};
    MKCoordinateRegion region = {coord , span};
    
    
    //地图初始化的时候显示的区域
    [ self.mapView setRegion:region];
    
    //创建Anation对象
    
    CLLocationCoordinate2D coord2 = {38.4,116.4};
    WXAnation *anation1 = [[ WXAnation alloc] initWithCoordinate2D:coord2];
    anation1.title = @"电影院";
    anation1.subtitle = @"小标题";
    [ self.mapView addAnnotation:anation1 ] ;
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    
    //判断是否为当前设备位置的annotation
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        //返回默认视图
        return nil ;
    }
    
    /*
     *大头针视图
     
     static NSString *identifier = @"Annotation";
     MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [ mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView == nil) {
//        annotationView = [[ MKAnnotationView alloc] initWithAnnotation:<#(id<MKAnnotation>)#> reuseIdentifier:identifier];
        
        //MKPinAnnotationView 是大头针视图
        annotationView = [[ MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier ];
        
        //设置是否显示小标题视图
        annotationView.canShowCallout = YES ;
    }
    
//    设置大头针颜色
    annotationView.pinColor = MKPinAnnotationColorRed ;
    annotationView.animatesDrop = YES ;
    
    
    UIButton *button = [ UIButton buttonWithType:UIButtonTypeDetailDisclosure ];
    [ button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside ];
    
    
    annotationView.rightCalloutAccessoryView = button;
    */
    
    //使用图片作为标注视图
    static NSString *identifier = @"Annotation";
    MKAnnotationView *annotationView = [ mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView == nil) {
        annotationView = [[ MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.image = [ UIImage imageNamed:@"ios.jpg"];
    }
    
    
    annotationView.annotation = annotation;
    return annotationView;
}

- (void)buttonAction
{
    NSLog(@"电影院信息");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
