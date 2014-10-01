#import <MBProgressHUD/MBProgressHUD.h>
#import "PlaceBidViewController.h"
#import "Listing.h"
#import "ComponentBuilder.h"
#import "PlaceBidView.h"
#import "ApiClient.h"

@interface PlaceBidViewController () <UIAlertViewDelegate>
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
  NSString *message = [NSString stringWithFormat:@"Are you sure to place the bid with $%@?", [self getBidValue]];
  [[[UIAlertView alloc] initWithTitle:@"Confirm bid" message:message delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 1) {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Processing, please wait...";
    [[ApiClient client] placeBidWithPrice:[self getBidValue]
                                onListing:self.listing.id
                                  success:^(Listing *listing){
                                      [hud hide:YES];
                                      [self dismissViewControllerAnimated:YES completion:^{
                                          [[NSNotificationCenter defaultCenter] postNotificationName:@"bidPlaced" object:nil userInfo:@{@"listing": listing}];
                                      }];
                                  }
                                  failure:^(NSError *error) {
                                      [hud hide:YES];
                                      NSLog(@"error: %@", error);
                                  }
    ];
  }
}

- (NSString *)getBidValue {
  return [(PlaceBidView *) self.view bidValue];
}

- (void)loadView {
  self.view = [[PlaceBidView alloc] initWithListing:self.listing];
}

@end
