#import "Good.h"

@implementation Good {

}

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (!self) return nil;
  [self setValuesForKeysWithDictionary:dictionary];
  return self;
}

@end