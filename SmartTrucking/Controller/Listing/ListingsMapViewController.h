#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class Listing;
@class User;

@interface ListingsMapViewController : UIViewController <MKMapViewDelegate>
- (void)listingCreated:(Listing *)listing;
@end