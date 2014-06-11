#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol CLLocationManagerDelegate;
@class CLLocationManager;

@interface ListingsMapViewController : UIViewController <CLLocationManagerDelegate>
@property(nonatomic, strong) CLLocationManager *locationManager;
@end