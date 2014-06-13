#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class Listing;

@interface STAnnotation : NSObject<MKAnnotation>
@property (nonatomic, strong) Listing *listing;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@end