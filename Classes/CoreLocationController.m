//
//  CoreLocationController.m
//  CoreLocationDemo
//


#import "CoreLocationController.h"


@implementation CoreLocationController

@synthesize locMgr, delegate;

- (id)init {
	self = [super init];
	
	if(self != nil) {
		self.locMgr = [[[CLLocationManager alloc] init] autorelease];
		self.locMgr.delegate = self;
	}
	
	return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {
		[self.delegate locationUpdate:newLocation];
	}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {
		[self.delegate locationError:error];
	}
}

//
// 4TL-----3TR
// |       |
// |     x |
// |       |
// 2BL-----1BR
// 1 = topLeftCorner
// 4 = bottomRightCorner
// x = targetCoordinate
//
//- (BOOL) positionInRect: (CLLocationCoordinate2D ) topLeftCorner bootomRightCorner:(CLLocationCoordinate2D) bottomRightCorner
//       targetCoordinate: (CLLocationCoordinate2D) targetCoordinate
//{
//    MKMapPoint topLeftPoint     = MKMapPointForCoordinate(topLeftCorner);
//    MKMapPoint bottomRightPoint = MKMapPointForCoordinate(bottomRightCorner);
//    MKMapRect  mapRect          = MKMapRectMake(topLeftPoint.x, topLeftPoint.y, bottomRightPoint.x, bottomRightPoint.y);
//    
//    MKMapPoint targetPoint      = MKMapPointForCoordinate(targetCoordinate);
//    float hoehe = MKMapRectGetHeight(mapRect);
//    NSLog(@"Die Höhe des Rechtecks ist %.8f",hoehe);
//    
//    BOOL isInside = MKMapRectContainsPoint(mapRect, targetPoint);
//    if (isInside)
//        return TRUE;
//    else
//        return FALSE;
//}
//

- (BOOL) latlngWithInBox:(CLLocationCoordinate2D) position point1:(CLLocationCoordinate2D)point1 point2:(CLLocationCoordinate2D)point2 point3:(CLLocationCoordinate2D)point3 point4:(CLLocationCoordinate2D)point4 {
    
    if (position.latitude >= point3.latitude && position.latitude <= point2.latitude
        && position.longitude >= point3.longitude && position.longitude <= point2.longitude) {
        return YES;
    }
    return NO;
}





- (BOOL) isLocationInRect: (CLLocationCoordinate2D) topRightCorner
            topLeftCorner: (CLLocationCoordinate2D) topLeftCorner
         bottomLeftCorner: (CLLocationCoordinate2D) bottomLeftCorner
        bottomRightCorner: (CLLocationCoordinate2D) bottomRightCorner
         targetCoordinate: (CLLocationCoordinate2D) targetCoordinate
{
//     bottomRightCorner = CLLocationCoordinate2DMake(topRightCorner.latitude, bottomLeftCorner.longitude);
//    
//    
//     topLeftCorner = CLLocationCoordinate2DMake(bottomLeftCorner.latitude, topRightCorner.longitude);
//    
    
        CLLocationCoordinate2D currentPosition = CLLocationCoordinate2DMake(targetCoordinate.latitude, targetCoordinate.longitude);
    
    return [self latlngWithInBox:currentPosition point1:topLeftCorner point2:topRightCorner point3:bottomLeftCorner point4:bottomRightCorner];
}


@end
