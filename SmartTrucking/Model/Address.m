#import <ObjectiveSugar/NSString+ObjectiveSugar.h>
#import "Address.h"

@interface Address ()
@end

@implementation Address {

}

- (instancetype)initWithString:(NSString *)address {
  self = [super init];
  if (!self) return nil;
  NSArray *array = [address split:@","];
  self.street = array[0];
  self.suburb = array[1];
  self.city = array[2];
  self.state = array[3];
  self.postcode = array[4];
  self.country = array[5];
  self.latitude = [array[6] doubleValue];
  self.longitude = [array[7] doubleValue];
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, %@, %@, %@, %@", self.street, self.suburb, self.city, self.state, self.postcode];
}

- (instancetype)initFromDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if(!self) return nil;
  [self setValuesForKeysWithDictionary:dictionary];
  return self;
}

- (NSString *)getId{
  return [self valueForKey:@"_id"];
}
@end