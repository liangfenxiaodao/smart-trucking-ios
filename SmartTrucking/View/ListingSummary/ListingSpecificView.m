#import "ListingSpecificView.h"
#import "DashedLine.h"
#import "Listing.h"
#import "Masonry.h"

#define HORIZONTAL_OFFSET 20


@interface ListingSpecificView ()

@property(nonatomic, strong) UILabel *specificLabel;
@property(nonatomic, strong) DashedLine *volumeLabelSeparator;
@property(nonatomic, strong) UILabel *volumeLabel;
@property(nonatomic, strong) DashedLine *weightLabelSeparator;
@property(nonatomic, strong) UILabel *weightLabel;
@property(nonatomic, strong) DashedLine *vehicleTypeLabelSeparator;
@property(nonatomic, strong) UILabel *vehicleTypeLabel;
@property(nonatomic, strong) DashedLine *specialCarryingPermitLabelSeparator;
@property(nonatomic, strong) UILabel *specialCarryingPermitLabel;
@property(nonatomic, strong) DashedLine *palletJackLabelSeparator;
@property(nonatomic, strong) UILabel *palletJackLabel;
@property(nonatomic, strong) DashedLine *tailgateLabelSeparator;
@property(nonatomic, strong) UILabel *tailgateLabel;
@property(nonatomic, strong) DashedLine *jobNumberLabelSeparator;
@property(nonatomic, strong) UILabel *jobNumberLabel;
@end

@implementation ListingSpecificView {

}

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;
  self.specificLabel = [self buildLabelWithText:@"Specifics"];
  self.specificLabel.font = [UIFont smallBoldFont];

  self.volumeLabelSeparator = [self buildSubSeparatorLine];
  self.volumeLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Volume: %@", listing.volume]];

  self.weightLabelSeparator = [self buildSubSeparatorLine];
  self.weightLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Weight: %@T", listing.weight]];

  self.vehicleTypeLabelSeparator = [self buildSubSeparatorLine];
  self.vehicleTypeLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Vehicle type: %@", listing.vehicleType]];

  self.vehicleTypeLabelSeparator = [self buildSubSeparatorLine];
  self.vehicleTypeLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Vehicle type: %@", listing.vehicleType]];
  self.specialCarryingPermitLabelSeparator = [self buildSubSeparatorLine];
  if (listing.specialCarryingPermitRequired) {
    self.specialCarryingPermitLabel = [self buildLabelWithText:@"Special carrying permit: Required"];
  } else {
    self.specialCarryingPermitLabel = [self buildLabelWithText:@"Special carrying permit: Not Required"];
  }
  self.palletJackLabelSeparator = [self buildSubSeparatorLine];
  if (listing.palletJackRequired) {
    self.palletJackLabel = [self buildLabelWithText:@"Pallet jack: Required"];
  } else {
    self.palletJackLabel = [self buildLabelWithText:@"Pallet jack: Not Required"];
  }
  self.tailgateLabelSeparator = [self buildSubSeparatorLine];
  self.tailgateLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Tailgate: %@", listing.tailgate]];
  self.jobNumberLabelSeparator = [self buildSubSeparatorLine];
  self.jobNumberLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Job number: %@", listing.jobNumber]];
  [self setupConstraints];
  return self;
}

- (void)setupConstraints {

  [self.specificLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.mas_top).with.offset(5);
    [self setupHorizontalConstraint:maker];
  }];

  [self.volumeLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.specificLabel.mas_bottom).with.offset(5);
    [self setupSeparatorConstraint:maker];
  }];

  [self.volumeLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.volumeLabelSeparator.mas_bottom).with.offset(5);
    [self setupHorizontalConstraint:maker];
  }];

  [self.weightLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.volumeLabel.mas_bottom).with.offset(5);
    [self setupSeparatorConstraint:maker];
  }];

  [self.weightLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.weightLabelSeparator.mas_bottom).with.offset(5);
    [self setupHorizontalConstraint:maker];
  }];

  [self.vehicleTypeLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.weightLabel.mas_bottom).with.offset(5);
    [self setupSeparatorConstraint:maker];
  }];

  [self.vehicleTypeLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.vehicleTypeLabelSeparator.mas_bottom).with.offset(5);
    [self setupHorizontalConstraint:maker];
  }];

  [self.specialCarryingPermitLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.vehicleTypeLabel.mas_bottom).with.offset(5);
    [self setupSeparatorConstraint:maker];
  }];

  [self.specialCarryingPermitLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.specialCarryingPermitLabelSeparator.mas_bottom).with.offset(5);
    [self setupHorizontalConstraint:maker];
  }];

  [self.palletJackLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.specialCarryingPermitLabel.mas_bottom).with.offset(5);
    [self setupSeparatorConstraint:maker];
  }];

  [self.palletJackLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.palletJackLabelSeparator.mas_bottom).with.offset(5);
    [self setupHorizontalConstraint:maker];
  }];

  [self.tailgateLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.palletJackLabel.mas_bottom).with.offset(5);
    [self setupSeparatorConstraint:maker];
  }];

  [self.tailgateLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.tailgateLabelSeparator.mas_bottom).with.offset(5);
    [self setupHorizontalConstraint:maker];
  }];

  [self.jobNumberLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.tailgateLabel.mas_bottom).with.offset(5);
    [self setupSeparatorConstraint:maker];
  }];

  [self.jobNumberLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.jobNumberLabelSeparator.mas_bottom).with.offset(5);
    [self setupHorizontalConstraint:maker];

  }];
}

@end