#import "UIColor+SmartTrucking.h"

@implementation UIColor (SmartTrucking)

+ (UIColor*) textColorDark {
  return [UIColor buildSimpleColor:88];
}

+ (UIColor*) textColorPrice {
  return [UIColor buildColorWithRed:107 green:170 blue:62];
}


+ (UIColor *)buildSimpleColor:(int)value {
  return [UIColor buildColorWithRed:value green:value blue:value];
}

+ (UIColor *)buildColorWithRed:(int)red green:(int)green blue:(int)blue {
  return [UIColor colorWithRed:(red / 255.0f) green:(green / 255.0f) blue:(blue / 255.0f) alpha:1];
}
@end