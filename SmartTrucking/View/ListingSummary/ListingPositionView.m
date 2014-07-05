#import "ListingPositionView.h"
#import "DashedLine.h"
#import "Listing.h"
#import "Masonry.h"

@interface ListingPositionView ()

@property(nonatomic, strong) UILabel *positionLabel;
@property(nonatomic, strong) DashedLine *pickupLabelSeparator;
@property(nonatomic, strong) UILabel *pickupLabel;
@property(nonatomic, strong) DashedLine *etpLabelSeparator;
@property(nonatomic, strong) UILabel *etpLabel;
@property(nonatomic, strong) DashedLine *deliveryLabelSeparator;
@property(nonatomic, strong) UILabel *deliveryLabel;
@property(nonatomic, strong) DashedLine *etaLabelSeparator;
@property(nonatomic, strong) UILabel *etaLabel;

@end

@implementation ListingPositionView {

}

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;
  self.positionLabel = [self buildLabelWithText:@"Position"];
  self.positionLabel.font = [UIFont smallBoldFont];
  self.pickupLabelSeparator = [self buildSubSeparatorLine];
  self.pickupLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Pick up: %@", listing.fromSuburb]];
  self.etpLabelSeparator = [self buildSubSeparatorLine];
  self.etpLabel = [self buildLabelWithText:[NSString stringWithFormat:@"ETP: %@", listing.formattedPickupTime]];
  self.deliveryLabelSeparator = [self buildSubSeparatorLine];
  self.deliveryLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Delivery: %@", listing.fromSuburb]];
  self.etaLabelSeparator = [self buildSubSeparatorLine];
  self.etaLabel = [self buildLabelWithText:[NSString stringWithFormat:@"ETA: %@", listing.formattedArriveTime]];
  [self setupConstraints];
  return self;
}

- (void)setupConstraints {
  [self.positionLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.mas_top).with.offset(VERTICAL_OFFSET);
    [self setupHorizontalConstraint:maker];
  }];

  [self.pickupLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.positionLabel.mas_bottom).with.offset(VERTICAL_OFFSET);
    [self setupSeparatorConstraint:maker];
  }];

  [self.pickupLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.pickupLabelSeparator.mas_bottom).with.offset(VERTICAL_OFFSET);
    [self setupHorizontalConstraint:maker];
  }];

  [self.etpLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.pickupLabel.mas_bottom).with.offset(VERTICAL_OFFSET);
    [self setupSeparatorConstraint:maker];
  }];

  [self.etpLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.etpLabelSeparator.mas_bottom).with.offset(VERTICAL_OFFSET);
    [self setupHorizontalConstraint:maker];
  }];

  [self.deliveryLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.etpLabel.mas_bottom).with.offset(VERTICAL_OFFSET);
    [self setupSeparatorConstraint:maker];
  }];

  [self.deliveryLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.deliveryLabelSeparator.mas_bottom).with.offset(VERTICAL_OFFSET);
    [self setupHorizontalConstraint:maker];
  }];

  [self.etaLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.deliveryLabel.mas_bottom).with.offset(VERTICAL_OFFSET);
    [self setupSeparatorConstraint:maker];
  }];

  [self.etaLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.etaLabelSeparator.mas_bottom).with.offset(VERTICAL_OFFSET);
    [self setupHorizontalConstraint:maker];
  }];
}

@end