#import "ListingSummaryViewController.h"
#import "Listing.h"
#import "ListingSummaryView.h"
#import "CustomNavigation.h"
#import "PlaceBidViewController.h"

@interface ListingSummaryViewController ()
@property(nonatomic, strong) Listing *listing;
@end

@implementation ListingSummaryViewController {

}

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;
  self.listing = listing;
  [self setTitle:@"Summary"];
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view = [[ListingSummaryView alloc] initWithListing:self.listing andTarget:self];
}

- (void)placeBidding {
  UINavigationController *modal = [[UINavigationController alloc] initWithNavigationBarClass:[CustomNavigation class]
                                                                                toolbarClass:nil];
  [modal pushViewController:[[PlaceBidViewController alloc] initWithListing:self.listing] animated:YES];
  [self presentViewController:modal animated:YES completion:nil ];
}
@end