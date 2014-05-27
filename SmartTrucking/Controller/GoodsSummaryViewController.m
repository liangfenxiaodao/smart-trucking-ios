#import "GoodsSummaryViewController.h"
#import "Goods.h"

@interface GoodsSummaryViewController ()
@property(nonatomic, strong) Goods *goods;
@property(nonatomic, strong) NSMutableArray *sectionsAndRows;
@end

@implementation GoodsSummaryViewController {

}
- (id)initWithGoods:(Goods *)goods {
  self = [super initWithStyle:UITableViewStyleGrouped];
  if (!self) return nil;
  self.goods = goods;
  [self.navigationItem setTitle:@"Summary"];
  self.sectionsAndRows = [NSMutableArray arrayWithArray:@[
          @[@{@"price" : @"Reference Rate: "}, @{@"volume" : @"Volume: "}, @{@"weight" : @"Weight: "}],
          @[@{@"fromSuburb" : @"Pick up: "}, @{@"toSuburb" : @"Drop off: "}, @{@"formattedPickupTime" : @"ETP: "}, @{@"formattedArriveTime" : @"ETA: "}],
          @[@{@"carType" : @"Car Type: "}, @{@"specialCarryingPermit" : @"Special Carrying Permit: "}, @{@"palletJack" : @"Pallet Jack: "}, @{@"tailGate" : @"Tailgate: "}],
          @[@{@"biddingAmount" : @"Bidding Activity"}, @{@"sellerName" : @"Seller"}]
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
  id value = [[self goods] valueForKey:propertyKey];
  if ([value isKindOfClass:[NSString class]])
    cell.detailTextLabel.text = value;
  else if ([propertyKey isEqualToString:@"price"])
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%@", value];
  else
    cell.detailTextLabel.text = [(NSNumber *)value stringValue];
  return cell;
}


@end