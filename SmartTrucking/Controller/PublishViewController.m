#import "PublishViewController.h"

@implementation PublishViewController {

}
- (id)init {
  self = [super init];
  if (!self) return nil;
  [self.tabBarItem setTitle:@"发布"];
  [self.tabBarItem setImage:[UIImage imageNamed:@"pen"]];
  return self;
}
@end