#import "AddListingViewController.h"
#import "XLForm.h"
#import "Address.h"
#import "Listing.h"
#import "NSArray+ObjectiveSugar.h"
#import "ApiClient.h"

@interface AddListingViewController ()
@property(nonatomic, strong) NSArray *address;
@property(nonatomic, strong) NSArray *vehicleTypes;
@property(nonatomic, strong) NSArray *tailgates;
@end

@implementation AddListingViewController {

}


- (id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    Address *address1 = [[Address alloc] initWithString:@"6 Marama Street, Blackburn South, Melbourne, VIC, 3130, Australia"];
    address1.id = @"538dc1a3250c9ece44000001";
    Address *address2 = [[Address alloc] initWithString:@"18/20 Hull Road, Croydon, Melbourne, VIC, 3136, Australia"];
    address2.id = @"538dc108250c9e9a68000001";
    self.address = [NSArray arrayWithObjects:address1, address2, nil];
    self.vehicleTypes = [NSArray arrayWithObjects:@"Van", @"Tray", @"Tautliner", @"Semi Trailor", nil];
    self.tailgates = [NSArray arrayWithObjects:@"not required", @"1.0T", @"1.5T", @"2.0T", @"2.5T", nil];
    self.navigationItem.leftBarButtonItem = self.cancelButton;
    self.navigationItem.rightBarButtonItem = self.saveButton;
    [self initializeForm];
  }
  return self;
}

- (void)initializeForm {
  XLFormDescriptor *form = [XLFormDescriptor formDescriptorWithTitle:@"Add Listing"];

  [self addPickupSection:form];
  [self addArriveSection:form];

  XLFormSectionDescriptor *section;
  XLFormRowDescriptor *row;
  section = [XLFormSectionDescriptor formSection];
  [form addFormSection:section];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"volume" rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Volume"];
  row.selectorOptions =
          @[
                  [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"1.2x2.4x1.2"],
                  [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"1.2x2.4x2.4"],
                  [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"1.2x2.4x3.6"]
          ];
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"weight" rowType:XLFormRowDescriptorTypeInteger];
  [row.cellConfigAtConfigure setObject:@"Weight" forKey:@"textField.placeholder"];
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"price" rowType:XLFormRowDescriptorTypeInteger];
  [row.cellConfigAtConfigure setObject:@"Reference Rate" forKey:@"textField.placeholder"];
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"bidEndingTime" rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Bid ending"];
  row.value = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24];
  [section addFormRow:row];

  section = [XLFormSectionDescriptor formSection];
  [form addFormSection:section];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"vehicleType" rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Vehicle type"];
  row.selectorTitle = @"Vehicle Type";
  row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.vehicleTypes[0]],
          [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:self.vehicleTypes[1]],
          [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:self.vehicleTypes[2]],
          [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:self.vehicleTypes[3]]
  ];
  [section addFormRow:row];

  [section addFormRow:[XLFormRowDescriptor formRowDescriptorWithTag:@"specialCarryingPermitRequired" rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Special carrying permit"]];
  [section addFormRow:[XLFormRowDescriptor formRowDescriptorWithTag:@"palletJackRequired" rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Pallet Jack"]];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"tailgate" rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Tailgate"];
  row.selectorTitle = @"Tailgate";
  row.selectorOptions = @[
          [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.tailgates[0]],
          [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:self.tailgates[1]],
          [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:self.tailgates[2]],
          [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:self.tailgates[3]],
          [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:self.tailgates[4]]
  ];
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"jobNumber" rowType:XLFormRowDescriptorTypeInteger];
  [row.cellConfigAtConfigure setObject:@"Job Number" forKey:@"textField.placeholder"];
  [section addFormRow:row];

  self.form = form;
}

- (void)addArriveSection:(XLFormDescriptor *)form {
  XLFormSectionDescriptor *section;
  XLFormRowDescriptor *row;
  section = [XLFormSectionDescriptor formSectionWithTitle:@"Arrive"];
  [form addFormSection:section];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"arriveAddress" rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Select"];
  row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:((Address *) self.address[0]).description],
          [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:((Address *) self.address[1]).description]
  ];
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"arriveStreet" rowType:XLFormRowDescriptorTypeText];
  [row.cellConfigAtConfigure setObject:@"Street" forKey:@"textField.placeholder"];
  row.disabled = YES;
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"arriveSuburb" rowType:XLFormRowDescriptorTypeText];
  [row.cellConfigAtConfigure setObject:@"Suburb" forKey:@"textField.placeholder"];
  row.disabled = YES;
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"arrivePostcode" rowType:XLFormRowDescriptorTypeText];
  [row.cellConfigAtConfigure setObject:@"Postcode" forKey:@"textField.placeholder"];
  row.disabled = YES;
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"arriveTime" rowType:XLFormRowDescriptorTypeDateTimeInline title:@"ETA"];
  row.value = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24];
  [section addFormRow:row];
}

- (void)addPickupSection:(XLFormDescriptor *)form {
  XLFormSectionDescriptor *section;
  XLFormRowDescriptor *row;

  section = [XLFormSectionDescriptor formSectionWithTitle:@"Pick up"];
  [form addFormSection:section];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"pickupAddress" rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Select"];
  row.selectorOptions = @[
          [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:((Address *) self.address[0]).description],
          [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:((Address *) self.address[1]).description]
  ];
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"pickupStreet" rowType:XLFormRowDescriptorTypeText];
  [row.cellConfigAtConfigure setObject:@"Street" forKey:@"textField.placeholder"];
  row.disabled = YES;
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"pickupSuburb" rowType:XLFormRowDescriptorTypeText];
  [row.cellConfigAtConfigure setObject:@"Suburb" forKey:@"textField.placeholder"];
  row.disabled = YES;
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"pickupPostcode" rowType:XLFormRowDescriptorTypeText];
  [row.cellConfigAtConfigure setObject:@"Postcode" forKey:@"textField.placeholder"];
  row.disabled = YES;
  [section addFormRow:row];

  row = [XLFormRowDescriptor formRowDescriptorWithTag:@"pickupTime" rowType:XLFormRowDescriptorTypeDateTimeInline title:@"ETP"];
  row.value = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24];
  [section addFormRow:row];
}

- (void)didSelectFormRow:(XLFormRowDescriptor *)formRow {
  [super didSelectFormRow:formRow];

  if ([formRow.tag isEqual:@"pickupAddress"]) {
    [self deselectFormRow:formRow];
  }
}

- (void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)rowDescriptor oldValue:(id)oldValue newValue:(id)newValue {
  [super formRowDescriptorValueHasChanged:rowDescriptor oldValue:oldValue newValue:newValue];
  if ([rowDescriptor.tag isEqualToString:@"pickupAddress"]) {
    Address *selectedAddress = _address[(NSUInteger) [[(XLFormOptionsObject *) newValue formValue] integerValue]];
    [self updateRowWithTag:@"pickupStreet" andNewvalue:selectedAddress.street];
    [self updateRowWithTag:@"pickupSuburb" andNewvalue:selectedAddress.suburb];
    [self updateRowWithTag:@"pickupPostcode" andNewvalue:selectedAddress.postcode];
  } else if ([rowDescriptor.tag isEqualToString:@"arriveAddress"]) {
    Address *selectedAddress = _address[(NSUInteger) [[(XLFormOptionsObject *) newValue formValue] integerValue]];
    [self updateRowWithTag:@"arriveStreet" andNewvalue:selectedAddress.street];
    [self updateRowWithTag:@"arriveSuburb" andNewvalue:selectedAddress.suburb];
    [self updateRowWithTag:@"arrivePostcode" andNewvalue:selectedAddress.postcode];
  }
}

- (void)updateRowWithTag:(NSString *)tag andNewvalue:(NSString *)newValue {
  XLFormRowDescriptor *descriptor = [self.form formRowWithTag:tag];
  [descriptor setValue:newValue];
  [[descriptor cellForFormController:self] update];
}

- (void)savePressed:(UIBarButtonItem *)saveButton {
  [self.tableView endEditing:YES];

  Listing *listing = [[Listing alloc] init];
  [@[@"pickupAddress", @"arriveAddress"] each:^(id propertyName){
    NSInteger addressIndex = [[[[self.form formRowWithTag:propertyName] value] formValue] integerValue];
    id address = _address[(NSUInteger) addressIndex];
    [listing setValue:address forKey:propertyName];
  }];
  [@[@"pickupTime", @"arriveTime", @"weight", @"price", @"bidEndingTime", @"jobNumber"] each:^(id propertyName) {
    [listing setValue:[[self.form formRowWithTag:propertyName] value] forKey:propertyName];
  }];
  [@[@"volume", @"vehicleType", @"tailgate"] each:^(id propertyName){
    [listing setValue:[[[self.form formRowWithTag:propertyName] value] formDisplayText] forKey:propertyName];
  }];
  [@[@"specialCarryingPermitRequired", @"palletJackRequired"] each:^(id propertyName){
    [listing setValue:[NSNumber numberWithBool:[[self.form formRowWithTag:propertyName].value boolValue]] forKey:propertyName];
  }];
  listing.userId = @"538db70c250c9e56be000001";
  [[ApiClient client] addListing:listing
     WithSuccess:^() {

     }
     error:^(NSError *error) {
       NSLog(@"error: %@", error);
     }];
}

@end