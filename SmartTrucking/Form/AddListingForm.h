#import <Foundation/Foundation.h>
#import "FXForms.h"

@class Address;

@interface AddListingForm : NSObject <FXForm>
@property(nonatomic, strong) NSNumber *weight;
@property(nonatomic, strong) NSNumber *length;
@property(nonatomic, strong) NSNumber *width;
@property(nonatomic, strong) NSNumber *height;
@property(nonatomic, assign) NSUInteger price;
@property(nonatomic, strong) NSString *tailgate;
@property(nonatomic, strong) Address *pickupAddress;
@property(nonatomic, strong) NSDate *pickupTime;
@property(nonatomic, strong) Address *arriveAddress;
@property(nonatomic, strong) NSDate *arriveTime;
@property(nonatomic, strong) NSDate *bidEndingTime;
@property(nonatomic, assign) NSUInteger jobNumber;
@property(nonatomic, strong) NSString *vehicleType;
@property(nonatomic, assign) BOOL specialCarryingPermitRequired;
@property(nonatomic, assign) BOOL palletJackRequired;

- (instancetype)initWithAddresses:(NSArray *)addresses
                     vehicleTypes:(NSArray *)vehicleTypes
                        tailgates:(NSArray *)tailgates;


@end