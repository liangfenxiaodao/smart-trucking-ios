#import "ListingSummaryViewController.h"
#import "Listing.h"
#import "ListingSummaryView.h"

@interface ListingSummaryViewController ()
@property(nonatomic, strong) Listing *listing;
@end

@implementation ListingSummaryViewController {

}

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;
  self.listing = listing;
  [self.navigationItem setTitle:@"Summary"];
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view = [[ListingSummaryView alloc] initWithListing:self.listing andDelegate:self ];
}

- (void)placeBidding {

}
@end