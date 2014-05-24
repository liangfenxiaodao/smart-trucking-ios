#import <Foundation/Foundation.h>

@interface Goods : NSObject
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *fromSuburb;
@property(nonatomic, strong) NSString *toSuburb;
@property(nonatomic, strong) NSString *pickUpTime;
@property(nonatomic, strong) NSString *arriveTime;
@property(nonatomic, assign) int price;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end