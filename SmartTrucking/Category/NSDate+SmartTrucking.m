#import "NSDate+SmartTrucking.h"


@implementation NSDate (SmartTrucking)

- (NSString *)toString {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"dd/MM/yy hh:mm a"];
  NSString *str_date = [dateFormatter stringFromDate:self];
  return str_date;
}


@end