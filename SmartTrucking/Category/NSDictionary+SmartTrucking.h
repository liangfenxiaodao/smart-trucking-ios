#import <Foundation/Foundation.h>

@interface NSDictionary (SmartTrucking)
- (id)valueForKey:(NSString *)key orDefault:(id)defaultValue;
@end