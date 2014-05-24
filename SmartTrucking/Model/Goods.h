#import <Foundation/Foundation.h>

@interface Goods : NSObject
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *fromSuburb;
@property(nonatomic, strong) NSString *toSuburb;
@property(nonatomic, strong) NSString *pickUpTime;
@property(nonatomic, strong) NSString *arriveTime;
@property(nonatomic, assign) int price;
@property(nonatomic, strong) NSString *bidEndingTime;
@property(nonatomic, assign) float weight;
@property (nonatomic, strong) NSString *formattedPickupTime;
@property (nonatomic, strong) NSString *formattedArriveTime;
- (id)initWithDictionary:(NSDictionary *)dictionary;
@end