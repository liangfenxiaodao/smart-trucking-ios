#import "Listing.h"
#import "Address.h"
#import "BiddingActivity.h"

@implementation Listing {

}

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (!self) return nil;
  self.id = dictionary[@"_id"];
  self.userId = dictionary[@"user_id"];
  self.pickupTime = [dictionary[@"pick_up_time"] toDate];
  self.deliveryTime = [dictionary[@"arrive_time"] toDate];
  self.bidEndingTime = [dictionary[@"bid_ending_time"] toDate];
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
  NSMutableArray *activities = [[NSMutableArray alloc]init];
  [dictionary[@"bidding_activities"] each:^(NSDictionary *activitiesDictionary){
      [activities addObject:[[BiddingActivity alloc] initWithDictionary:activitiesDictionary]];
  }];
  self.biddingActivities = [NSArray arrayWithArray:activities];
  return self;
}

- (NSString *)formattedPickupTime {
  return [self.pickupTime toString];
}

- (NSString *)formattedDeliveryTime {
  return [self.deliveryTime toString];
}

- (NSString *)getVolume {
  return [NSString stringWithFormat:@"%@ x %@ x %@", self.length, self.width, self.height];
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