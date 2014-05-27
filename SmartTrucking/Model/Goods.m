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

- (NSString *)specialCarryingPermit {
  return _specialCarryingPermitRequired? @"Required" : @"No";
}

- (NSString *)palletJack {
  return _palletJackRequired? @"Required" : @"No";
}


- (NSString *)getWeight{
  return [NSString stringWithFormat:@"%@T", _weight];
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