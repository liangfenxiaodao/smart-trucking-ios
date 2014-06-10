#import <Foundation/Foundation.h>

@class Address;

@interface Listing : NSObject
@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSString *userId;
@property(nonatomic, strong) NSString *fromSuburb;
@property(nonatomic, strong) NSString *toSuburb;
@property(nonatomic, strong) Address *pickupAddress;
@property(nonatomic, strong) Address *arriveAddress;
@property(nonatomic, strong) NSDate *pickupTime;
@property(nonatomic, strong) NSDate *arriveTime;
@property(nonatomic, assign) int price;
@property(nonatomic, strong) NSDate *bidEndingTime;
@property(nonatomic, strong) NSString *weight;
@property(nonatomic, strong) NSString *volume;
@property(nonatomic, strong) NSString *formattedPickupTime;
@property(nonatomic, strong) NSString *formattedArriveTime;
@property(nonatomic, strong) NSString *vehicleType;
@property(nonatomic, assign) BOOL specialCarryingPermitRequired;
@property(nonatomic, assign) BOOL palletJackRequired;
@property(nonatomic, strong) NSString *tailgate;
@property(nonatomic, assign) int biddingAmount;
@property(nonatomic, strong) NSString *customerName;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSString *)specialCarryingPermit;

- (NSString *)palletJack;
@end