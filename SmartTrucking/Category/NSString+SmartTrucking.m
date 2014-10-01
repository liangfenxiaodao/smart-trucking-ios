#import "NSString+SmartTrucking.h"


@implementation NSString (SmartTrucking)

- (NSDate *)toDate {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssXXX"];
  [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
  return [formatter dateFromString:self];
}


@end