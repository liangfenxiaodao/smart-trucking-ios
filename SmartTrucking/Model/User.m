#import "User.h"
#import "ObjectiveSugar.h"
#import "Address.h"

@implementation User {

}

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (!self) return nil;
  self.id = dictionary[@"_id"];
  self.firstName = dictionary[@"first_name"];
  self.lastName = dictionary[@"last_name"];
  self.isCustomer = dictionary[@"is_customer"];
  self.username = dictionary[@"username"];
  self.addresses = [[NSMutableArray alloc] init];
  [dictionary[@"address"] each:^(NSDictionary *addressDic) {
    [self.addresses addObject:[[Address alloc] initFromDictionary:addressDic]];
  }];
  return self;
}

@end