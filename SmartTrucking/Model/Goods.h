#import <Foundation/Foundation.h>

@interface Goods : NSObject
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *fromSuburb;
@property(nonatomic, strong) NSString *toSuburb;
@property(nonatomic, strong) NSString *pickUpTime;
@property(nonatomic, strong) NSString *arriveTime;
@property(nonatomic, assign) int price;
@property(nonatomic, strong) NSString *bidEndingTime;
@property(nonatomic, strong, getter=getWeight) NSString *weight;
@property(nonatomic, strong) NSString *volume;
@property(nonatomic, strong) NSString *formattedPickupTime;
@property(nonatomic, strong) NSString *formattedArriveTime;
@property(nonatomic, strong) NSString *vehicleType;
@property(nonatomic, assign) BOOL specialCarryingPermitRequired;
@property(nonatomic, assign) BOOL palletJackRequired;
@property(nonatomic, strong) NSString *tailGate;
@property(nonatomic, assign) int biddingAmount;
@property(nonatomic, strong) NSString *customerName;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSString *)specialCarryingPermit;
- (NSString *)palletJack;
@end