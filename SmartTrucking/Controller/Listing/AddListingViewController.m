#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "AddListingViewController.h"
#import "AddListingForm.h"
#import "Listing.h"
#import "ApiClient.h"
#import "ListingsMapViewController.h"
#import "User.h"

@interface AddListingViewController ()
@property(nonatomic, strong) NSArray *address;
@property(nonatomic, strong) NSArray *vehicleTypes;
@property(nonatomic, strong) NSArray *tailgates;
@property (nonatomic, strong) ListingsMapViewController *delegate;
@property(nonatomic, strong) User *user;
@end

@implementation AddListingViewController {

}

- (id)initWithUser: (User *)user delegate: (ListingsMapViewController *)delegate {
  self = [super init];
  self.user = user;
  self.delegate = delegate;
  if (!self) return nil;
  self.address = user.addresses;
  self.vehicleTypes = @[@"Van", @"Tray", @"Tautliner", @"Semi Trailor"];
  self.tailgates = @[@"not required", @"1.0T", @"1.5T", @"2.0T", @"2.5T"];
  self.formController.form = [[AddListingForm alloc] initWithAddresses:self.address vehicleTypes:self.vehicleTypes tailgates:self.tailgates];

  [self.navigationItem setTitle:@"Add Listing"];
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed)];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed)];
  return self;
}

- (void)donePressed {
  Listing *listing = [self populateListingFromInput];

  MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
  [self.navigationController.view addSubview:HUD];
  [HUD show:YES];
  HUD.labelText = @"processing...";
  [[ApiClient client] addListing:listing
    WithSuccess:^() {
      [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate listingCreated:listing];
        [HUD hide:YES];
      }];
    }
    error:^(NSError *error) {
      [HUD hide:YES];
       NSLog(@"error: %@", error);
    }
  ];
}

- (Listing *)populateListingFromInput {
  AddListingForm *form = (AddListingForm *) self.formController.form;
  Listing *listing = [[Listing alloc] init];
  [@[@"pickupTime", @"arriveTime", @"bidEndingTime",
          @"weight", @"referenceRate", @"length",@"width", @"height",
          @"specialCarryingPermitRequired", @"palletJackRequired",
          @"vehicleType", @"tailgate", @"jobNumber", @"pickupAddress", @"arriveAddress"] each:^(id propertyName) {
    [listing setValue:[form valueForKey:propertyName] forKey:propertyName];
  }];
  listing.userId = self.user.id;
  return listing;
}

- (void)cancelPressed {
  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end