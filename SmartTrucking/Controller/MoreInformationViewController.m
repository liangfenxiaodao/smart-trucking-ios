#import "MoreInformationViewController.h"

@implementation MoreInformationViewController {

}

- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.tabBarItem setTitle:@"More"];
  [self.tabBarItem setImage:[UIImage imageNamed:@"more"]];
  return self;
}
@end