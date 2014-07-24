#import "ComponentBuilder.h"

@implementation ComponentBuilder {

}
+ (UIBarButtonItem *)createBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
  UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:target
                                                            action:action];
//  [button setBackgroundImage:[UIImage imageNamed:@"ClearButtonBackground"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
  [button setTitleTextAttributes:@{ NSForegroundColorAttributeName: [UIColor whiteColor],
      NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:17] }
                        forState:UIControlStateNormal];
  return button;
}


@end