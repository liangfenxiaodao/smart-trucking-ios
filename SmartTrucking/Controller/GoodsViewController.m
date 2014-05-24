#import "GoodsViewController.h"
#import "MBProgressHUD.h"
#import "ApiClient.h"

@interface GoodsViewController ()

@property(nonatomic, strong) NSArray *goods;
@end

@implementation GoodsViewController {

}

- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.tabBarItem setTitle:@"货源"];
  [self.tabBarItem setImage:[UIImage imageNamed:@"truck"]];
  return self;
}


- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  hud.labelText = @"Loading...";
  [[ApiClient client] getAllGoodsWithSuccess:^(NSArray *result) {
    self.goods = result;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
  } error:^(NSError *error) {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
  }];
}

@end