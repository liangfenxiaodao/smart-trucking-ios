#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class Listing;

@interface ListingsMapViewController : UIViewController <MKMapViewDelegate>
- (void)listingCreated:(Listing *)listing;
@end