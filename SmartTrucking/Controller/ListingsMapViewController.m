#import "ListingsMapViewController.h"
#import "Masonry.h"
#import <MapKit/MapKit.h>
#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import "MBProgressHUD.h"
#import "ApiClient.h"
#import "Listing.h"
#import "Address.h"

@interface ListingsMapViewController ()
@property(nonatomic, strong) MKMapView *mapView;
@property(nonatomic, strong) NSMutableArray *listings;
@property(nonatomic) BOOL userLocationUpdated;
@end

@implementation ListingsMapViewController {

}
- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.tabBarItem setTitle:@"Listings"];
  [self.tabBarItem setImage:[UIImage imageNamed:@"interstate_truck"]];

  self.view = [[UIView alloc] init];

  self.mapView = MKMapView.new;
  [self.mapView setShowsUserLocation:YES];
  [self.mapView setDelegate:self];
  [self.view addSubview:self.mapView];
  [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.view.mas_top);
    make.right.equalTo(self.view.mas_right);
    make.bottom.equalTo(self.view.mas_bottom);
    make.left.equalTo(self.view.mas_left);
  }];
  return self;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
  if (self.userLocationUpdated) {
    return;
  }
  self.userLocationUpdated = YES;
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 2000, 2000);
  [self.mapView setRegion:region animated:YES];
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];

  [[ApiClient client] getAllListingsWithSuccess:^(NSArray *result) {
    self.listings = [NSMutableArray arrayWithArray:result];
    [self showListings:self.listings];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
  } error:^(NSError *error) {
    NSLog(@"error: %@", error);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
  }];
}

- (void)showListings:(NSMutableArray *)listings {
  [self.mapView removeAnnotations:self.mapView.annotations];
  [listings each:^(Listing *listing) {
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(listing.pickupAddress.latitude, listing.pickupAddress.longitude);
    point.title = [NSString stringWithFormat:@"Delivery: %@", listing.arriveAddress.suburb];
    point.subtitle = [NSString stringWithFormat:@"%@, %@T, $%i", listing.volume, listing.weight, listing.price];
    [self.mapView addAnnotation:point];
  }];
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation {
  if([annotation isKindOfClass:[MKUserLocation class]]){
    return nil;
  }
  static NSString *annotationIdentifier = @"annotationIdentifier";

  MKPinAnnotationView *pinView =
          (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
  if (pinView == nil) {
    MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc]
            initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
    customPinView.pinColor = MKPinAnnotationColorRed;
    customPinView.animatesDrop = YES;
    customPinView.canShowCallout = YES;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    customPinView.rightCalloutAccessoryView = rightButton;
    return customPinView;
  }
  else {
    pinView.annotation = annotation;
  }
  return pinView;
}

@end