#import "MyAccountViewController.h"

@implementation MyAccountViewController {

}

- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.tabBarItem setTitle:@"My Account"];
  [self.tabBarItem setImage:[UIImage imageNamed:@"user_male"]];
  return self;
}
@end