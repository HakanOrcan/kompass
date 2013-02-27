//
//  CoreLocationController.h
//  CoreLocationDemo
//


#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@protocol CoreLocationControllerDelegate
@required

- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;

@end


@interface CoreLocationController : NSObject <CLLocationManagerDelegate> {
	CLLocationManager *locMgr;
	id delegate;
    
  
}

@property (nonatomic, retain) CLLocationManager *locMgr;
@property (nonatomic, assign) id delegate;
- (BOOL) isLocationInRect: (CLLocationCoordinate2D ) topRightCorner
            topLeftCorner: (CLLocationCoordinate2D) topLeftCorner
         bottomLeftCorner: (CLLocationCoordinate2D) bottomLeftCorner
        bottomRightCorner: (CLLocationCoordinate2D) bottomRightCorner
         targetCoordinate: (CLLocationCoordinate2D) targetCoordinate;

@end
