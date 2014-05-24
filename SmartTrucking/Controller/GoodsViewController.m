#import "GoodsViewController.h"
#import "MBProgressHUD.h"
#import "ApiClient.h"
#import "Goods.h"
#import "GoodsCell.h"

@interface GoodsViewController ()

@property(nonatomic, strong) NSMutableArray *goodsArray;
@end

@implementation GoodsViewController {

}

- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.tabBarItem setTitle:@"货源"];
  [self.tabBarItem setImage:[UIImage imageNamed:@"interstate_truck"]];
  
  _goodsArray = [[NSMutableArray alloc] init];
  return self;
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

@end