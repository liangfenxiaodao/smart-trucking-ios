#import "ListingsViewController.h"
#import "MBProgressHUD.h"
#import "ApiClient.h"
#import "Listing.h"
#import "ListingsCell.h"
#import "ListingsSummaryViewController.h"

@interface ListingsViewController ()

@property(nonatomic, strong) NSMutableArray *goodsArray;
@end

@implementation ListingsViewController {

}

- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.navigationItem setTitle:@"Listings"];
  [self.tabBarItem setTitle:@"Listings"];
  [self.tabBarItem setImage:[UIImage imageNamed:@"interstate_truck"]];
  [self.navigationItem.rightBarButtonItem = [UIBarButtonItem alloc]
          initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
  _goodsArray = [[NSMutableArray alloc] init];
  return self;
}

- (void)add {
  NSLog(@"add");
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.tableView setTableFooterView:[[UIView alloc]init]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _goodsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  Listing *goods = [_goodsArray objectAtIndex:(NSUInteger) indexPath.row];
  ListingsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:@"ListingsCell"];
  if(goodsCell == nil){
    goodsCell = [[ListingsCell alloc]init];
  }
  [goodsCell setGoods:goods];
  return goodsCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 85;
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  hud.labelText = @"Loading...";
  [[ApiClient client] getAllGoodsWithSuccess:^(NSArray *result) {
    _goodsArray = [NSMutableArray arrayWithArray:result];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.tableView reloadData];
  } error:^(NSError *error) {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
  }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Listing *goods = [self.goodsArray objectAtIndex:(NSUInteger) indexPath.row];
  ListingsSummaryViewController *summaryViewController = [[ListingsSummaryViewController alloc] initWithGoods:goods];
  [self.navigationController pushViewController:summaryViewController animated:YES];
}

@end