#import "ListingSummary2ViewController.h"
#import "Listing.h"
#import "ListingSummaryView.h"

@interface ListingSummary2ViewController ()
@property(nonatomic, strong) Listing *listing;
@end

@implementation ListingSummary2ViewController {

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
  self.view = [[ListingSummaryView alloc] initWithListing:self.listing];
}

@end