#import <Foundation/Foundation.h>

@class Address;

@interface Listing : NSObject
@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSString *userId;
@property(nonatomic, strong) Address *pickupAddress;
@property(nonatomic, strong) Address *deliveryAddress;
@property(nonatomic, strong) NSDate *pickupTime;
@property(nonatomic, strong) NSDate *deliveryTime;
@property(nonatomic, assign) int referenceRate;
@property(nonatomic, strong) NSDate *bidEndingTime;
@property(nonatomic, strong) NSString *weight;
@property(nonatomic, strong, getter=getVolume) NSString *volume;
@property(nonatomic, strong) NSString *length;
@property(nonatomic, strong) NSString *width;
@property(nonatomic, strong) NSString *height;
@property(nonatomic, strong) NSString *vehicleType;
@property(nonatomic, assign) BOOL specialCarryingPermitRequired;
@property(nonatomic, assign) BOOL palletJackRequired;
@property(nonatomic, strong) NSString *tailgate;
@property(nonatomic, strong) NSString *jobNumber;

@property(nonatomic, strong) NSString *customerName;

@property(nonatomic, strong) NSString *formattedPickupTime;
@property(nonatomic, strong) NSString *formattedDeliveryTime;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end