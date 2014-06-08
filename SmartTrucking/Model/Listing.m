#import "Listing.h"
#import "NSString+ObjectiveSugar.h"
#import "Address.h"

@implementation Listing {

}

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (!self) return nil;
  self.id = dictionary[@"_id"];
  self.userId = dictionary[@"user_id"];
  self.pickUpTime = dictionary[@"pick_up_time"];
  self.arriveTime = dictionary[@"arrive_time"];
  self.bidEndingTime = dictionary[@"bid_ending_time"];
  self.palletJackRequired = [dictionary[@"pallet_jack_required"] boolValue];
  self.price = [dictionary[@"price"] intValue];
  self.specialCarryingPermitRequired = [dictionary[@"special_carrying_permit_required"] boolValue];
  self.tailGate = dictionary[@"tail_gate"];
  self.vehicleType = dictionary[@"vehicle_type"];
  self.volume = dictionary[@"volume"];
  self.weight = dictionary[@"weight"];
  self.fromAddress = [[Address alloc]initWithString: dictionary[@"from_address"]];
  self.toAddress = [[Address alloc]initWithString: dictionary[@"to_address"]];
  self.fromSuburb = self.fromAddress.suburb;
  self.toSuburb = self.toAddress.suburb;
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
  [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssXXX"];
  [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
  return [formatter dateFromString:date];
}

@end