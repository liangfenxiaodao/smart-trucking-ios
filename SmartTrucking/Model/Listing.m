#import "Listing.h"
#import "Address.h"

@implementation Listing {

}

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (!self) return nil;
  self.id = dictionary[@"_id"];
  self.userId = dictionary[@"user_id"];
  self.pickupTime = [self parseDate:dictionary[@"pick_up_time"]];
  self.deliveryTime = [self parseDate:dictionary[@"arrive_time"]];
  self.bidEndingTime = [self parseDate: dictionary[@"bid_ending_time"]];
  self.palletJackRequired = [dictionary[@"pallet_jack_required"] boolValue];
  self.referenceRate = [dictionary[@"reference_rate"] intValue];
  self.specialCarryingPermitRequired = [dictionary[@"special_carrying_permit_required"] boolValue];
  self.tailgate = dictionary[@"tail_gate"];
  self.vehicleType = dictionary[@"vehicle_type"];
  self.weight = dictionary[@"weight"];
  self.length = dictionary[@"length"];
  self.width = dictionary[@"width"];
  self.height = dictionary[@"height"];
  self.jobNumber = dictionary[@"job_number"];
  self.pickupAddress = [[Address alloc]initWithString: dictionary[@"from_address"]];
  self.deliveryAddress = [[Address alloc]initWithString: dictionary[@"to_address"]];
  return self;
}

- (NSString *)formattedPickupTime {
  return [self formatDate:self.pickupTime];
}

- (NSString *)formattedDeliveryTime {
  return [self formatDate:self.deliveryTime];
}

- (NSString *)getVolume {
  return [NSString stringWithFormat:@"%@ x %@ x %@", self.length, self.width, self.height];
}

- (NSString *)formatDate: (NSDate *)date {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"dd/MM/yy hh:mm a"];
  NSString *str_date = [dateFormatter stringFromDate:date];
  return str_date;
}

- (NSDate*) parseDate:(NSString*)date {
  NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
  [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssXXX"];
  [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
  return [formatter dateFromString:date];
}

- (NSDictionary *)toParameters{
  return @{@"from_address_id": self.pickupAddress.id,
      @"to_address_id": self.deliveryAddress.id,
      @"user_id": self.userId,
      @"reference_rate": @(self.referenceRate),
      @"weight": self.weight?:@"0",
      @"length": self.length?:@"0",
      @"width": self.width?:@"0",
      @"height": self.height?:@"0",
      @"pick_up_time": self.pickupTime,
      @"arrive_time": self.deliveryTime,
      @"bid_ending_time": self.bidEndingTime,
      @"vehicle_type": self.vehicleType?:@"Van",
      @"job_number": @0,
      @"special_carrying_permit_required": @(self.specialCarryingPermitRequired),
      @"pallet_jack_required": @(self.palletJackRequired),
      @"tail_gate": self.tailgate?:@"Not Required"};
}
@end