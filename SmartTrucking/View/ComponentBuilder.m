#import "ComponentBuilder.h"

@implementation ComponentBuilder {

}
+ (UIBarButtonItem *)createBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
  UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:target
                                                            action:action];
  [button setTitleTextAttributes:@{ NSForegroundColorAttributeName: [UIColor blueColor],
      NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:17] }
                        forState:UIControlStateNormal];
  return button;
}


@end