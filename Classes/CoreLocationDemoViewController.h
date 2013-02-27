//
//  CoreLocationDemoViewController.h
//  CoreLocationDemo
//


#import <UIKit/UIKit.h>
#import "CoreLocationController.h"
#import "CHCSV.h"


@interface CoreLocationDemoViewController : UIViewController <CoreLocationControllerDelegate> {
	CoreLocationController *CLController;
	IBOutlet UILabel *locLabel;
}

@property (nonatomic, retain) CoreLocationController *CLController;



@end

