#import "ListingSummaryViewController.h"
#import "Listing.h"

@interface ListingSummaryViewController ()
@property(nonatomic, strong) Listing *listing;
@property(nonatomic, strong) NSMutableArray *sectionsAndRows;
@end

@implementation ListingSummaryViewController {

}
- (id)initWithListings:(Listing *)listings {
  self = [super initWithStyle:UITableViewStyleGrouped];
  if (!self) return nil;
  self.listing = listings;
  [self.navigationItem setTitle:@"Summary"];
  self.sectionsAndRows = [NSMutableArray arrayWithArray:@[
          @[@{@"price" : @"Reference Rate: "}, @{@"volume" : @"Volume: "}, @{@"weight" : @"Weight: "}],
          @[@{@"fromSuburb" : @"Pick up: "}, @{@"formattedPickupTime" : @"ETP: "}, @{@"toSuburb" : @"Delivery: "}, @{@"formattedArriveTime" : @"ETA: "}],
          @[@{@"vehicleType" : @"Vehicle Type: "}, @{@"specialCarryingPermit" : @"Special Carrying Permit: "}, @{@"palletJack" : @"Pallet Jack: "}, @{@"tailgate" : @"Tailgate: "}, @{@"jobNumber": @"Job Number:"}],
          @[@{@"biddingAmount" : @"Bidding Activity"}, @{@"customerName" : @"Customer"}]
  ]];
  return self;
}

- (void)loadView {
  [super loadView];
  [self.tableView setTableFooterView:[[UIView alloc] init]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [self.sectionsAndRows count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[self.sectionsAndRows objectAtIndex:(NSUInteger) section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"goodsSummaryCell"];
  NSDictionary *dictionary = [[self.sectionsAndRows objectAtIndex:(NSUInteger) indexPath.section] objectAtIndex:(NSUInteger) indexPath.row];
  NSString *propertyKey = [dictionary allKeys][0];
  cell.textLabel.text = [dictionary valueForKey:propertyKey];
  id value = [[self listing] valueForKey:propertyKey];
  if ([value isKindOfClass:[NSString class]]) {
    cell.detailTextLabel.text = value;
  }
  else if ([propertyKey isEqualToString:@"price"]) {
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%@", value];
  }
  else {
    cell.detailTextLabel.text = [(NSNumber *) value stringValue];
  }

  if(indexPath.section == 3){
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }
  return cell;
}


@end