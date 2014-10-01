#import "NSString+SmartTrucking.h"


@implementation NSString (SmartTrucking)

- (NSDate *)toDate {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssXXX"];
  [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
  return [formatter dateFromString:self];
}


- (BOOL)digitsNoMoreThan:(int)digits {
  if (self.length == 0) {
    return YES;
  }
  NSNumber *numberVersion = [[[NSNumberFormatter alloc] init] numberFromString:self];
  if (numberVersion == nil) {
    return NO;
  }

  NSArray *splitByDot = [self componentsSeparatedByString:@"."];
  return !(splitByDot.count == 2 && [splitByDot[1] length] > digits);
}
@end