#import "TopLineLabel.h"

@implementation TopLineLabel {

}

- (void)drawRect:(CGRect)rect {
  [super drawRect:rect];
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetRGBStrokeColor(context, 62.0f / 255.0f, 62.0f / 255.0f, 62.0f / 255.0f, 1.0);
  CGContextSetLineWidth(context, 1.0);
  CGContextMoveToPoint(context, 0, 0);
  CGContextAddLineToPoint(context, rect.size.width, 0);
  CGContextStrokePath(context);
}

@end