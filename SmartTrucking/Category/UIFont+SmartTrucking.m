#import "UIFont+SmartTrucking.h"

@implementation UIFont (SmartTrucking)

+ (UIFont *)goodsListFont {
  return [UIFont fontWithName:@"HelveticaNeue" size:13];
}

+ (UIFont *)smallFont {
  return [UIFont fontWithName:@"HelveticaNeue" size:13];
}

+ (UIFont *)smallBoldFont {
  return [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
}

+ (UIFont *)goodsLocationFont {
  return [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
}

+ (UIFont *)buttonFont {
  return [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
}

@end