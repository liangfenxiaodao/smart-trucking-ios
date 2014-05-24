#import "Goods.h"

@implementation Goods {

}

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (!self) return nil;
  [self setValuesForKeysWithDictionary:dictionary];
  return self;
}

@end