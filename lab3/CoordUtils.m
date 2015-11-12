//
//  CoordUtils.m
//  lab3
//
//  Created by Ernst Haagsman on 11/11/15.
//  Copyright © 2015 student. All rights reserved.
//
//  Haversine: https://github.com/heycarsten/haversine-objc/
//  Bearing: http://stackoverflow.com/questions/3809337/calculating-bearing-between-two-cllocationcoordinate2ds
//

#import "CoordUtils.h"

#define degreesToRadians(x) (M_PI * x / 180.0)
#define radiandsToDegrees(x) (x * 180.0 / M_PI)

float const HAVERSINE_RADS_PER_DEGREE = 0.0174532925199433;
float const HAVERSINE_KM_RADIUS = 6371.0;

@implementation CoordUtils

+ (float) metersBetween: (CLLocationCoordinate2D)here :(CLLocationCoordinate2D) andThere{
    float lat1 = here.latitude;
    float lon1 = here.longitude;
    float lat2 = andThere.latitude;
    float lon2 = andThere.longitude;
    
    float lat1Rad = lat1 * HAVERSINE_RADS_PER_DEGREE;
    float lat2Rad = lat2 * HAVERSINE_RADS_PER_DEGREE;
    float dLonRad = ((lon2 - lon1) * HAVERSINE_RADS_PER_DEGREE);
    float dLatRad = ((lat2 - lat1) * HAVERSINE_RADS_PER_DEGREE);
    float a = pow(sin(dLatRad / 2), 2) + cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLonRad / 2), 2);
    float d = 2 * atan2(sqrt(a), sqrt(1 - a));
    float km = d * HAVERSINE_KM_RADIUS;
    return km * 1000;
}

+ (float) bearingBetween: (CLLocationCoordinate2D)here :(CLLocationCoordinate2D) andThere {
    float fLat = degreesToRadians(here.latitude);
    float fLng = degreesToRadians(here.longitude);
    float tLat = degreesToRadians(andThere.latitude);
    float tLng = degreesToRadians(andThere.longitude);
    
    float degree = radiandsToDegrees(atan2(sin(tLng-fLng)*cos(tLat), cos(fLat)*sin(tLat)-sin(fLat)*cos(tLat)*cos(tLng-fLng)));
    
    if (degree >= 0) {
        return degree;
    } else {
        return 360+degree;
    }
}

@end
