#import "ListingsViewController.h"
#import "MBProgressHUD.h"
#import "ApiClient.h"
#import "Listing.h"
#import "ListingsCell.h"
#import "ListingSummaryViewController.h"

@interface ListingsViewController ()

@property(nonatomic, strong) NSMutableArray *listingsArray;
@end

@implementation ListingsViewController {

}

- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.navigationItem setTitle:@"Listings"];
  _listingsArray = [[NSMutableArray alloc] init];
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.tableView setTableFooterView:[[UIView alloc]init]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _listingsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  Listing *listing = _listingsArray[(NSUInteger) indexPath.row];
  ListingsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:@"ListingsCell"];
  if(goodsCell == nil){
    goodsCell = [[ListingsCell alloc]init];
  }
  [goodsCell setGoods:listing];
  return goodsCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 85;
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  hud.labelText = @"Loading...";
  [[ApiClient client] getAllListingsWithSuccess:^(NSArray *result) {
    _listingsArray = [NSMutableArray arrayWithArray:result];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.tableView reloadData];
  } error:^(NSError *error) {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
  }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Listing *listing = (self.listingsArray)[(NSUInteger) indexPath.row];
  ListingSummaryViewController *summaryViewController = [[ListingSummaryViewController alloc] initWithListing:listing];
  [self.navigationController pushViewController:summaryViewController animated:YES];
}

@end