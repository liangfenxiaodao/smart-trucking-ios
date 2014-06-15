#import "CreateListingForm.h"

@implementation CreateListingForm {

}

- (NSArray *)fields {
  return @[
    @{FXFormFieldKey : @"pickupAddress", FXFormFieldTitle : @"Pick up", FXFormFieldHeader : @"Transport"},
    @{FXFormFieldKey : @"pickupTime", FXFormFieldTitle : @"ETP", FXFormFieldType : FXFormFieldTypeDateTime},
    @{FXFormFieldKey : @"arriveAddress", FXFormFieldTitle : @"Delivery"},
    @{FXFormFieldKey : @"arriveTime", FXFormFieldTitle : @"ETA", FXFormFieldType : FXFormFieldTypeDateTime},

    @{FXFormFieldKey : @"length", FXFormFieldHeader : @""},
    @"width",
    @"height",
    @"weight",
    @{FXFormFieldKey : @"price", FXFormFieldTitle : @"Reference rate", FXFormFieldType : FXFormFieldTypeInteger},
    @"bidEndingTime",

    @{FXFormFieldKey : @"vehicleType", FXFormFieldTitle : @"Vehicle type", FXFormFieldHeader : @"", FXFormFieldOptions : @[@"Van", @"Tray", @"Tautliner", @"Semi Trailor"]},
    @{FXFormFieldKey : @"specialCarryingPermitRequired", FXFormFieldTitle : @"Specail carrying permit"},
    @{FXFormFieldKey : @"palletJackRequired", FXFormFieldTitle : @"Pallet jack"},
    @{FXFormFieldKey : @"tailgate", FXFormFieldType : FXFormFieldTypeOption, FXFormFieldOptions : @[@"not required", @"1.0T", @"1.5T", @"2.0T", @"2.5T"]},

    @{FXFormFieldKey : @"jobNumber", FXFormFieldTitle : @"Job number", FXFormFieldHeader : @"", FXFormFieldType : FXFormFieldTypeInteger}
  ];
}

@end