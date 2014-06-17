//
//  WXAnation.m
//  MapDemo
//
//  Created by 张岩松 on 14-1-17.
//  Copyright (c) 2014年 张岩松. All rights reserved.
//

#import "WXAnation.h"

@implementation WXAnation

- (id) initWithCoordinate2D: (CLLocationCoordinate2D) coordinate
{
    self = [ super init ];
    if (self != nil) {
        _coordinate = coordinate;
    }
    return self;
}
@end
