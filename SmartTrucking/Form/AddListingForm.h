#import <Foundation/Foundation.h>
#import "FXForms.h"

@interface AddListingForm : NSObject <FXForm>
@property(nonatomic, strong) NSNumber *weight;
@property(nonatomic, strong) NSNumber *length;
@property(nonatomic, strong) NSNumber *width;
@property(nonatomic, strong) NSNumber *height;
@property(nonatomic, assign) NSUInteger price;
@property(nonatomic, strong) NSString *tailgate;
@property(nonatomic, strong) NSString *pickupAddress;
@property(nonatomic, strong) NSString *pickupTime;
@property(nonatomic, strong) NSString *arriveAddress;
@property(nonatomic, strong) NSString *arriveTime;
@property(nonatomic, strong) NSString *bidEndingTime;
@property(nonatomic, assign) NSUInteger jobNumber;
@property(nonatomic, strong) NSString *vehicleType;
@property(nonatomic, assign) BOOL specialCarryingPermitRequired;
@property(nonatomic, assign) BOOL palletJackRequired;
@end