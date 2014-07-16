#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import "AddListingForm.h"
#import "Address.h"

@interface AddListingForm()
@property(nonatomic, strong) NSArray *addresses;
@property(nonatomic, strong) NSArray *vehicleTypes;
@property(nonatomic, strong) NSArray *tailgates;
@end

@implementation AddListingForm {

}

- (instancetype)initWithAddresses:(NSArray *)addresses
                     vehicleTypes:(NSArray *)vehicleTypes
                        tailgates:(NSArray *)tailgates {
  self = [super init];
  if (!self) return nil;
  self.addresses = addresses;
  self.vehicleTypes = vehicleTypes;
  self.tailgates = tailgates;
  return self;
}


- (NSArray *)fields {
  return @[
    @{FXFormFieldKey : @"pickupAddress", FXFormFieldTitle : @"Pick up",
            FXFormFieldHeader : @"Transport",
            FXFormFieldOptions : self.addresses,
            FXFormFieldValueTransformer : ^(Address *address) {
              return [address description];
            }
    },
    @{FXFormFieldKey : @"pickupTime", FXFormFieldTitle : @"ETP", FXFormFieldType : FXFormFieldTypeDateTime},
    @{FXFormFieldKey : @"deliveryAddress", FXFormFieldTitle : @"Delivery",
            FXFormFieldOptions : self.addresses,
            FXFormFieldValueTransformer : ^(Address *address) {
              return [address description];
            }
    },
    @{FXFormFieldKey : @"deliveryTime", FXFormFieldTitle : @"ETA", FXFormFieldType : FXFormFieldTypeDateTime},

    @{FXFormFieldKey : @"length", FXFormFieldHeader : @""},
    @"width",
    @"height",
    @"weight",
    @{FXFormFieldKey : @"referenceRate", FXFormFieldTitle : @"Reference rate", FXFormFieldType : FXFormFieldTypeInteger},
    @{FXFormFieldKey: @"bidEndingTime",FXFormFieldType : FXFormFieldTypeDateTime},

    @{FXFormFieldKey : @"vehicleType", FXFormFieldTitle : @"Vehicle type", FXFormFieldHeader : @"",
            FXFormFieldOptions : self.vehicleTypes},
    @{FXFormFieldKey : @"specialCarryingPermitRequired", FXFormFieldTitle : @"Specail carrying permit"},
    @{FXFormFieldKey : @"palletJackRequired", FXFormFieldTitle : @"Pallet jack"},
    @{FXFormFieldKey : @"tailgate", FXFormFieldOptions : self.tailgates},

    @{FXFormFieldKey : @"jobNumber", FXFormFieldTitle : @"Job number", FXFormFieldHeader : @"", FXFormFieldType : FXFormFieldTypeInteger}
  ];
}

@end