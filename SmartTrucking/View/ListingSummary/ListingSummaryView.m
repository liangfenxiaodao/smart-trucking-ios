#import "ListingSummaryView.h"
#import "Masonry.h"
#import "Listing.h"
#import "DashedLine.h"

#define HORIZONTAL_OFFSET 20


@interface ListingSummaryView ()
@property(nonatomic, strong) UIScrollView *contentView;
@property(nonatomic, strong) UIView *topSeparatorLine;
@property(nonatomic, strong) UILabel *referenceRateLabel;
@property(nonatomic, strong) UILabel *currentBidLabel;
@property(nonatomic, strong) UILabel *timeLeftLabel;
@property(nonatomic, strong) UIView *positionSeparatorLine;
@property(nonatomic, strong) UILabel *positionLabel;
@property(nonatomic, strong) DashedLine *positionSubSeparatorLine;
@property(nonatomic, strong) UIView *specificSeparatorLine;
@property(nonatomic, strong) UILabel *specificLabel;
@property(nonatomic, strong) UILabel *vehicleTypeLabel;
@property(nonatomic, strong) UILabel *specialCarryingPermitLabel;
@property(nonatomic, strong) UILabel *tailgateLabel;
@property(nonatomic, strong) UILabel *jobNumberLabel;
@property(nonatomic, strong) UILabel *palletJackLabel;
@property(nonatomic, strong) DashedLine *vehicleTypeLabelSeparator;
@property(nonatomic, strong) DashedLine *specialCarryingPermitLabelSeparator;
@property(nonatomic, strong) DashedLine *palletJackLabelSeparator;
@property(nonatomic, strong) DashedLine *tailgateLabelSeparator;
@property(nonatomic, strong) DashedLine *jobNumberLabelSeparator;
@end

@implementation ListingSummaryView {

}

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;
  self.backgroundColor = [UIColor whiteColor];
  self.contentView = [[UIScrollView alloc] init];
  [self addSubview:self.contentView];

  self.topSeparatorLine = [self buildSeparatorLine];
  self.referenceRateLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Reference rate: %i", listing.referenceRate]];
  self.currentBidLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Current bid: %i", 50]];
  self.timeLeftLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Time left: %@", @"1h 20m"]];
  self.specificSeparatorLine = [self buildSeparatorLine];
  self.specificLabel = [self buildLabelWithText:@"Specifics"];
  self.specificLabel.font = [UIFont smallBoldFont];
  self.vehicleTypeLabelSeparator = [self buildSubSeparatorLine];
  self.vehicleTypeLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Vehicle type: %@", listing.vehicleType]];
  self.specialCarryingPermitLabelSeparator = [self buildSubSeparatorLine];
  if (listing.specialCarryingPermitRequired) {
    self.specialCarryingPermitLabel = [self buildLabelWithText:@"Special carrying permit: required"];
  } else {
    self.specialCarryingPermitLabel = [self buildLabelWithText:@"Special carrying permit: not required"];
  }
  self.palletJackLabelSeparator = [self buildSubSeparatorLine];
  if (listing.palletJackRequired) {
    self.palletJackLabel = [self buildLabelWithText:@"Pallet jack: required"];
  } else {
    self.palletJackLabel = [self buildLabelWithText:@"Pallet jack: not required"];
  }
  self.tailgateLabelSeparator = [self buildSubSeparatorLine];
  self.tailgateLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Tailgate: %@", listing.tailgate]];
  self.jobNumberLabelSeparator = [self buildSubSeparatorLine];
  self.jobNumberLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Job number: %@", listing.jobNumber]];
  [self layout];
  return self;
}

- (void)layout {
  [self.contentView mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
  }];

  [self.referenceRateLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.contentView).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
  }];

  [self.currentBidLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.referenceRateLabel.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
  }];

  [self.timeLeftLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.currentBidLabel.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
  }];

  [self.specificSeparatorLine mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.timeLeftLabel.mas_bottom).with.offset(10);
    maker.left.equalTo(self);
    maker.right.equalTo(self);
    maker.height.mas_equalTo(1);
  }];

  [self.specificLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.specificSeparatorLine.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
  }];

  [self.vehicleTypeLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.specificLabel.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
    maker.height.mas_equalTo(1);
  }];

  [self.vehicleTypeLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.vehicleTypeLabelSeparator.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
  }];

  [self.specialCarryingPermitLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.vehicleTypeLabel.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
    maker.height.mas_equalTo(1);
  }];

  [self.specialCarryingPermitLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.specialCarryingPermitLabelSeparator.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
  }];

  [self.palletJackLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.specialCarryingPermitLabel.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
    maker.height.mas_equalTo(1);
  }];

  [self.palletJackLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.palletJackLabelSeparator.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
  }];

  [self.tailgateLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.palletJackLabel.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
    maker.height.mas_equalTo(1);
  }];

  [self.tailgateLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.tailgateLabelSeparator.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
  }];

  [self.jobNumberLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.tailgateLabel.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
    maker.height.mas_equalTo(1);
  }];

  [self.jobNumberLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.jobNumberLabelSeparator.mas_bottom).with.offset(5);
    maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
    maker.right.equalTo(self);
  }];

}

- (UILabel *)buildLabelWithText:(NSString *)text {
  UILabel *label = [[UILabel alloc] init];
  label.text = text;
  label.textColor = [UIColor textColor];
  label.font = [UIFont smallFont];
  [self addSubview:label];
  return label;
}

- (UIView *)buildSeparatorLine {
  UIView *line = [[UIView alloc] init];
  [line setBackgroundColor:[UIColor grayColor]];
  [self addSubview:line];
  return line;
}

- (DashedLine *)buildSubSeparatorLine {
  DashedLine *dashedLine = [[DashedLine alloc] init];
  [self addSubview:dashedLine];
  return dashedLine;
}

@end