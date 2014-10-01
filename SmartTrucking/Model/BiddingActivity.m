#import "BiddingActivity.h"
#import "NSDictionary+SmartTrucking.h"

@implementation BiddingActivity {

}

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (!self) return nil;
  self.id = dictionary[@"_id"];
  self.bidderId = [dictionary valueForKey:@"bidder_id" orDefault:@""];
  self.bidderName = [dictionary valueForKey:@"bidder_name" orDefault:@"unknown"];
  self.biddingTime = [dictionary[@"bidding_time"] toDate];
  self.biddingValue = [dictionary valueForKey:@"bidding_value" orDefault:@0];
  return self;
}

@end