//
//  CoreLocationDemoViewController.m
//  CoreLocationDemo
//


#import "CoreLocationDemoViewController.h"
#import "CHCSV.h"


@implementation CoreLocationDemoViewController 

@synthesize CLController;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //parsen
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"Fried4Points" ofType:@"poi"];
// 
//    
//    NSError *error = nil;
//    NSArray *rows = [NSArray arrayWithContentsOfCSVFile:path encoding:NSUTF8StringEncoding error:&error];
//    if (rows == nil) {
//        //something went wrong; log the error and exit
//        NSLog(@"error parsing file: %@", error);
//        return;
//    }else
//        NSLog(@"%@", rows[0][10]);


	CLController = [[CoreLocationController alloc] init];
    
	CLController.delegate = self;
	[CLController.locMgr startUpdatingLocation];
    
}

- (void)locationUpdate:(CLLocation *)location {
	//locLabel.text = [location description];
    CLLocationCoordinate2D BR, BL, TR, TL, targetCoordinate;
    //NSUInteger *elements;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Fried4Points" ofType:@"poi"];
    
    
    NSError *error = nil;
    NSArray *rows = [NSArray arrayWithContentsOfCSVFile:path encoding:NSUTF8StringEncoding error:&error];
    if (rows == nil) {
        //something went wrong; log the error and exit
        NSLog(@"error parsing file: %@", error);
        return;
    }else{
       // *elements = [rows count];
       NSEnumerator *e = [rows objectEnumerator];
        id object;
        int i = 0;
        NSDecimalNumber *lat,*lon;
        NSString *latCoordStr, *lonCoordStr;
        
        while (object = [e nextObject]) {
            //NSLog(@"%@",object[10]);
            i++;
            
            if (i+1== [rows count])
                i=0;
          //  lat = rows[0][0];
            latCoordStr = rows[i][0];
            lonCoordStr = rows[i][1];
            //NSString *coordStr = @"-33.890934125621094";
            lat = [NSDecimalNumber decimalNumberWithString:latCoordStr];
            lon = [NSDecimalNumber decimalNumberWithString:lonCoordStr];
            BR = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
            
            latCoordStr = rows[i][2];
            lonCoordStr = rows[i][3];
            //NSString *coordStr = @"-33.890934125621094";
            lat = [NSDecimalNumber decimalNumberWithString:latCoordStr];
            lon = [NSDecimalNumber decimalNumberWithString:lonCoordStr];
            BL = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
            
            latCoordStr = rows[i][4];
            lonCoordStr = rows[i][5];
            //NSString *coordStr = @"-33.890934125621094";
            lat = [NSDecimalNumber decimalNumberWithString:latCoordStr];
            lon = [NSDecimalNumber decimalNumberWithString:lonCoordStr];
            TR = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
            
            latCoordStr = rows[i][6];
            lonCoordStr = rows[i][7];
            //NSString *coordStr = @"-33.890934125621094";
            lat = [NSDecimalNumber decimalNumberWithString:latCoordStr];
            lon = [NSDecimalNumber decimalNumberWithString:lonCoordStr];
            TL = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
           
//    Punkt von Enland/London im Rechteck
//    BR = CLLocationCoordinate2DMake(52.00, -0.20);
//    BL = CLLocationCoordinate2DMake(50.00, -0.20);
//    TR = CLLocationCoordinate2DMake(52.00, 0.00);
//    TL = CLLocationCoordinate2DMake(50.00, 0.00);
    
//    Punkt von Enland/London nicht im Rechteck
//    BR = CLLocationCoordinate2DMake(50.00, -0.20);
//    BL = CLLocationCoordinate2DMake(40.00, -0.20);
//    TR = CLLocationCoordinate2DMake(50.00, 0.00);
//    TL = CLLocationCoordinate2DMake(40.00, 0.00);
    
    targetCoordinate.latitude = location.coordinate.latitude;
    targetCoordinate.longitude = location.coordinate.longitude;
        
    if ([CLController.self isLocationInRect:TR topLeftCorner:TL bottomLeftCorner:BL bottomRightCorner:BR targetCoordinate:targetCoordinate] ){
        NSLog(@"%@",rows[i][10]);
        locLabel.text = rows[i][10];
       // NSLog(@"%@",object[10]);
        NSLog(@"%@",[location description]);
    }else{
        NSLog(@"Nicht anwesend");
        NSLog(@"%@",[location description]);
    }
    }
    }
}

- (void)locationError:(NSError *)error {
	//locLabel.text = [error description];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

- (void)viewDidUnload {
}

- (void)dealloc {
	[CLController release];
    [super dealloc];
   
}

//     BR = CLLocationCoordinate2DMake(52.00, -0.20);   nummer 3  wird zu 1
//    BL = CLLocationCoordinate2DMake(50.00, -0.20);    nummer 4
//    TR = CLLocationCoordinate2DMake(52.00, 0.00);     nummer 2
//    TL = CLLocationCoordinate2DMake(50.00, 0.00);     nummer 1

@end
