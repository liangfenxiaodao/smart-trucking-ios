#import "Goods.h"

@implementation Goods {

}

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (!self) return nil;
  [self setValuesForKeysWithDictionary:dictionary];
  self.formattedPickupTime = [self formatDate:self.pickUpTime];
  self.formattedArriveTime = [self formatDate:self.arriveTime];
  return self;
}

- (NSString *)formatDate: (NSString *)date {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"dd/MM/yy hh:mm a"];
  NSString *str_date = [dateFormatter stringFromDate:[self parseDate:date]];
  return str_date;
}
- (NSDate*) parseDate:(NSString*)date {
  NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
  [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
  return [formatter dateFromString:date];
}

@end