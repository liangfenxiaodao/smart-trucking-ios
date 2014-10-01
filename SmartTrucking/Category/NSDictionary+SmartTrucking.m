#import "NSDictionary+SmartTrucking.h"


@implementation NSDictionary (SmartTrucking)

- (id) valueForKey:(NSString *)key orDefault:(id)defaultValue {
  id result = [self valueForKey:key];
  return (result == [NSNull null] || result == nil) ? defaultValue : result;
}

@end