#import "CustomNavigation.h"


@implementation CustomNavigation

- (void) drawRect:(CGRect)rect {
  UIColor *colorFlat = [UIColor clearColor];
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(context, [colorFlat CGColor]);
  CGContextFillRect(context, rect);

  [self setTranslucent:NO];
//  [self setTintColor:[UIColor clearColor]];
}

@end
