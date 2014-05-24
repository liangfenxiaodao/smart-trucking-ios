#import "GoodsViewController.h"
#import "MBProgressHUD.h"
#import "ApiClient.h"

@interface GoodsViewController ()

@property(nonatomic, strong) NSArray *goods;
@end

@implementation GoodsViewController {

}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  hud.labelText = @"Loading...";
  [[ApiClient client] getAllGoodsWithSuccess:^(NSArray *result) {
    self.goods = result;
    NSLog(@"loading finished, need to hide HUD");
    [MBProgressHUD hideHUDForView:self.view animated:YES];
  } error:^(NSError *error) {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
  }];
}

@end