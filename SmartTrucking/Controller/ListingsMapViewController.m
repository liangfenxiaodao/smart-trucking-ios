#import "ListingsMapViewController.h"
#import "Masonry.h"
#import <MapKit/MapKit.h>

@interface ListingsMapViewController ()
@property(nonatomic, strong) MKMapView *mapView;

@property(nonatomic) CLLocationCoordinate2D targetCoordinate;
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
  self.targetCoordinate = userLocation.coordinate;
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.targetCoordinate, 2000, 2000);
  [self.mapView setRegion:region animated:YES];
//  [self.mapView regionThatFits:region];
}
@end