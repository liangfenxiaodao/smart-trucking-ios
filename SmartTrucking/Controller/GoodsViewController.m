#import "GoodsViewController.h"
#import "MBProgressHUD.h"
#import "ApiClient.h"
#import "Goods.h"
#import "GoodsCell.h"
#import "GoodsSummaryViewController.h"

@interface GoodsViewController ()

@property(nonatomic, strong) NSMutableArray *goodsArray;
@end

@implementation GoodsViewController {

}

- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.navigationItem setTitle:@"Listings"];
  [self.tabBarItem setTitle:@"Listings"];
  [self.tabBarItem setImage:[UIImage imageNamed:@"interstate_truck"]];
  
  _goodsArray = [[NSMutableArray alloc] init];
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.tableView setTableFooterView:[[UIView alloc]init]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _goodsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  Goods *goods = [_goodsArray objectAtIndex:(NSUInteger) indexPath.row];
  GoodsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:@"GoodsCell"];
  if(goodsCell == nil){
    goodsCell = [[GoodsCell alloc]init];
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
  Goods *goods = [self.goodsArray objectAtIndex:(NSUInteger) indexPath.row];
  GoodsSummaryViewController *summaryViewController = [[GoodsSummaryViewController alloc] initWithGoods:goods];
  [self.navigationController pushViewController:summaryViewController animated:YES];
}

@end