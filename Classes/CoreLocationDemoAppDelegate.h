//
//  CoreLocationDemoAppDelegate.h
//  CoreLocationDemo
//


#import <UIKit/UIKit.h>

@class CoreLocationDemoViewController;

@interface CoreLocationDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoreLocationDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoreLocationDemoViewController *viewController;

@end

