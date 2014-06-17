#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "AddListingViewController.h"
#import "AddListingForm.h"
#import "Address.h"
#import "Listing.h"
#import "ApiClient.h"
#import "ListingsMapViewController.h"

@interface AddListingViewController ()
@property(nonatomic, strong) NSArray *address;
@property(nonatomic, strong) NSArray *vehicleTypes;
@property(nonatomic, strong) NSArray *tailgates;
@end

@implementation AddListingViewController {

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
  {
    Address *address1 = [[Address alloc] initWithString:@"18 Jackson Street,Croydon,Melbourne,VIC,3136,Australia,-37.794483,145.288522"];
    address1.id = @"539ae977250c9e59e3000002";
    Address *address2 = [[Address alloc] initWithString:@"12 Hull Road,Croydon,Melbourne,VIC,3136,Australia,-37.797225,145.291577"];
    address2.id = @"5399a4d8250c9e97c0000001";
    Address *address3 = [[Address alloc] initWithString:@"65 Hewish Road,Croydon,Melbourne,VIC,3136,Australia,-37.797225,145.291577"];
    address3.id = @"539ae9ac250c9e59e3000003";
    self.address = @[address1, address2, address3];
    self.vehicleTypes = @[@"Van", @"Tray", @"Tautliner", @"Semi Trailor"];
    self.tailgates = @[@"not required", @"1.0T", @"1.5T", @"2.0T", @"2.5T"];
    //set up form
    self.formController.form = [[AddListingForm alloc] initWithAddresses:self.address vehicleTypes:self.vehicleTypes tailgates:self.tailgates];
    [self.navigationItem setTitle:@"Add Listing"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed)];
  }
  return self;
}

- (void)donePressed {
  AddListingForm *form = (AddListingForm *) self.formController.form;
  Listing *listing = [[Listing alloc] init];
  [@[@"pickupTime", @"arriveTime", @"bidEndingTime",
          @"weight", @"referenceRate", @"length",@"width", @"height",
          @"specialCarryingPermitRequired", @"palletJackRequired",
          @"vehicleType", @"tailgate", @"jobNumber", @"pickupAddress", @"arriveAddress"] each:^(id propertyName) {
    [listing setValue:[form valueForKey:propertyName] forKey:propertyName];
  }];
  listing.userId = @"538dc203250c9e08f0000002";
  MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
  [self.navigationController.view addSubview:HUD];

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

- (void)cancelPressed {
  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end