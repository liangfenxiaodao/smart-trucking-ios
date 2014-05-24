#import "SearchViewController.h"

@implementation SearchViewController {

}

- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.tabBarItem setTitle:@"搜索"];
  [self.tabBarItem setImage:[UIImage imageNamed:@"search"]];
  return self;
}
@end