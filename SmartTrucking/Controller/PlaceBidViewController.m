#import "PlaceBidViewController.h"
#import "Listing.h"
#import "ComponentBuilder.h"
#import "PlaceBidView.h"

@interface PlaceBidViewController ()
@property(nonatomic, strong) Listing *listing;
@end

@implementation PlaceBidViewController

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;
  self.listing = listing;
  [self setTitle:@"Place Bid"];
  self.navigationItem.leftBarButtonItem = [ComponentBuilder createNavItemWithTitle:@"Cancel" target:self action:@selector(cancel)];
  self.navigationItem.rightBarButtonItem = [ComponentBuilder createNavItemWithTitle:@"Continue" target:self action:@selector(save)];
  return self;
}

- (void)cancel {
  [self dismissViewControllerAnimated:YES completion:^{
  }];
}

- (void)save {
  NSString *message = [NSString stringWithFormat:@"Are you sure to place the bid with $%@?",
          [(PlaceBidView *)self.view bidValue]];
  [[[UIAlertView alloc] initWithTitle:@"Confirm bid"
                              message:message
                             delegate:self
                    cancelButtonTitle:@"No"
                    otherButtonTitles:@"Yes", nil] show];
}

- (void)loadView {
  self.view = [[PlaceBidView alloc] initWithListing:self.listing];
}

@end
