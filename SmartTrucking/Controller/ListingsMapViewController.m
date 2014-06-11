#import <CoreLocation/CoreLocation.h>
#import "ListingsMapViewController.h"
#import "Masonry.h"
#import <MapKit/MapKit.h>
@interface ListingsMapViewController()
@property (nonatomic, strong) MKMapView* mapView;

@property(nonatomic) CLLocationCoordinate2D targetCoordinate;
@end
@implementation ListingsMapViewController {

}
- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.tabBarItem setTitle:@"Listings"];
  [self.tabBarItem setImage:[UIImage imageNamed:@"interstate_truck"]];

  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  self.locationManager.distanceFilter = kCLDistanceFilterNone;
  self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
  [self.locationManager startUpdatingLocation];

  self.view = [[UIView alloc] init];

  self.mapView = MKMapView.new;
  [self.view addSubview:self.mapView];
  [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.view.mas_top);
    make.right.equalTo(self.view.mas_right);
    make.bottom.equalTo(self.view.mas_bottom);
    make.left.equalTo(self.view.mas_left);
  }];
  return self;
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
  CLLocation *location = [locations lastObject];
  NSLog(@"lat%f - lon%f", location.coordinate.latitude, location.coordinate.longitude);
  [self.locationManager stopUpdatingLocation];
  self.targetCoordinate = location.coordinate;
  MKCoordinateSpan span = MKCoordinateSpanMake(0.02, 0.02);
  MKCoordinateRegion region = MKCoordinateRegionMake(self.targetCoordinate, span);
  [self.mapView setRegion:region animated:NO];
  [self.mapView regionThatFits:region];
}
@end