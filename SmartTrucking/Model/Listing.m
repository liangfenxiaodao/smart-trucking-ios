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
  self.arriveTime = [self parseDate:dictionary[@"arrive_time"]];
  self.bidEndingTime = [self parseDate: dictionary[@"bid_ending_time"]];
  self.palletJackRequired = [dictionary[@"pallet_jack_required"] boolValue];
  self.referenceRate = [dictionary[@"referenceRate"] intValue];
  self.specialCarryingPermitRequired = [dictionary[@"special_carrying_permit_required"] boolValue];
  self.tailgate = dictionary[@"tail_gate"];
  self.vehicleType = dictionary[@"vehicle_type"];
  self.weight = dictionary[@"weight"];
  self.length = dictionary[@"length"];
  self.width = dictionary[@"width"];
  self.height = dictionary[@"height"];
  self.jobNumber = dictionary[@"job_number"];
  self.pickupAddress = [[Address alloc]initWithString: dictionary[@"from_address"]];
  self.arriveAddress = [[Address alloc]initWithString: dictionary[@"to_address"]];
  self.fromSuburb = self.pickupAddress.suburb;
  self.toSuburb = self.arriveAddress.suburb;
  self.formattedPickupTime = [self formatDate:self.pickupTime];
  self.formattedArriveTime = [self formatDate:self.arriveTime];
  return self;
}

- (NSString *)specialCarryingPermit {
  return _specialCarryingPermitRequired? @"Required" : @"No";
}

- (NSString *)palletJack {
  return _palletJackRequired? @"Required" : @"No";
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

@end