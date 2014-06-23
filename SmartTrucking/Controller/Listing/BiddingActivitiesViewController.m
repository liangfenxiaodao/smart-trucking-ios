#import "BiddingActivitiesViewController.h"
#import "Listing.h"

@interface BiddingActivitiesViewController ()
@property(nonatomic, strong) Listing *listing;
@end

@implementation BiddingActivitiesViewController {

}

- (id)initWithListing:(Listing *)listing {
  self = [super initWithStyle:UITableViewStyleGrouped];
  if (!self) return nil;
  self.listing = listing;
  [self.navigationItem setTitle:@"Bidding Activities"];

  return self;
}

- (void)loadView {
  [super loadView];
  [self.tableView setTableFooterView:[[UIView alloc] init]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  switch (section) {
    case 0:
      return 2;
    case 1:
      return 1;
    default:
      return 0;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"goodsSummaryCell"];
  switch (indexPath.section) {
    case 0:
      switch (indexPath.row) {
        case 0:
          cell.textLabel.text = @"Bids: ";
          cell.detailTextLabel.text = @"10";
          break;
        case 1:
          cell.textLabel.text = @"Bidders: ";
          cell.detailTextLabel.text = @"8";
          break;
        default:
          break;
      }
      break;
    case 1:
      cell.textLabel.text = @"$100";
      cell.detailTextLabel.text = @"24 Jan 2014, 8:24 pm";
      break;
    default:
      break;
  }
  return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  switch (section){
    case 0:
      return @"Summary";
    case 1:
      return @"Most recent bids";
    default:
      return @"";
  }
}

@end