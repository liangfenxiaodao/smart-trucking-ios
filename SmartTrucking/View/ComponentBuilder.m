#import "ComponentBuilder.h"

@implementation ComponentBuilder {

}

+ (UIBarButtonItem *)createNavItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
  UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:target
                                                            action:action];
  [button setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor],
          NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:17]}
                        forState:UIControlStateNormal];
  return button;
}

+ (UITextField *)numericTextField {
  UITextField *field = [[UITextField alloc] init];
  [field setBackgroundColor:[UIColor textEntryBackgroundColor]];
  [[field layer] setBorderColor:[UIColor textEntryBorderColor].CGColor];
  [[field layer] setBorderWidth:0.6f];
  [field setFont:[UIFont textEntryFont]];
  [field setTextColor:[UIColor textColor]];
  field.keyboardType = UIKeyboardTypeDecimalPad;
  field.textAlignment = NSTextAlignmentRight;
  field.clearButtonMode = UITextFieldViewModeNever;
  UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
  field.rightView = paddingView;
  field.rightViewMode = UITextFieldViewModeAlways;
  return field;
}
@end