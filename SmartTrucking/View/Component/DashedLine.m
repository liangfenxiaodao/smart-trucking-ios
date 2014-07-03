#import "DashedLine.h"


@implementation DashedLine {

}

static CGFloat const kDashedPhase = 0.0f;
static CGFloat const kDashedLinesLength[] = {2.0f, 2.0f};
static size_t const kDashedCount = 2.0f;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (!self) return nil;

  [self setBackgroundColor:[UIColor buildSimpleColor:255]];
  return self;
}

- (void)drawRect:(CGRect)rect {
  [super drawRect:rect];
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, rect.size.height);
  CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
  // Draw a single line from left to right
  CGContextSetLineDash(context, kDashedPhase, kDashedLinesLength, kDashedCount);
  CGContextMoveToPoint(context, 0, 0);
  CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
  CGContextStrokePath(context);
}
@end