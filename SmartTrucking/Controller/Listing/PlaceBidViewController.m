#import "PlaceBidViewController.h"
#import "Listing.h"
#import "PlaceBidView.h"
#import "ComponentBuilder.h"

@interface PlaceBidViewController ()
@property(nonatomic, strong) Listing *listing;
@end

@implementation PlaceBidViewController {

}

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;
  self.listing = listing;
  [self setTitle:@"Place Bid"];
  self.navigationItem.leftBarButtonItem =
      [ComponentBuilder createBarButtonItemWithTitle:@"Cancel"
                                              target:self
                                              action:@selector(cancel)];

  self.navigationItem.rightBarButtonItem =
      [ComponentBuilder createBarButtonItemWithTitle:@"Continue"
                                              target:self
                                              action:@selector(save)];
  return self;
}

- (void)cancel{

}

- (void)save{

}

- (void)loadView{
  [super loadView];
  self.view = [[PlaceBidView alloc] initWithListing:self.listing andTarget:self];
}
@end