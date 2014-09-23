#import "ListingBasicInfoView.h"
#import "Listing.h"
#import "DashedLine.h"

@interface ListingBasicInfoView ()
@property(nonatomic, strong) UILabel *basicInfoLabel;
@property(nonatomic, strong) DashedLine *referenceRateLabelSeparator;
@property(nonatomic, strong) UILabel *referenceRateLabel;
@property(nonatomic, strong) DashedLine *currentBidLabelSeparator;
@property(nonatomic, strong) UILabel *currentBidLabel;
@property(nonatomic, strong) DashedLine *timeLeftLabelSeparator;
@property(nonatomic, strong) UILabel *timeLeftLabel;
@end

@implementation ListingBasicInfoView {

}
//TODO remove initWithListing method
- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (!self) return nil;
  self.basicInfoLabel = [self buildLabelWithText:@"Basic Information"];
  self.basicInfoLabel.font = [UIFont smallBoldFont];
  self.referenceRateLabelSeparator = [self buildSubSeparatorLine];
  self.referenceRateLabel = [self buildLabelWithText:@""];
  self.currentBidLabelSeparator = [self buildSubSeparatorLine];
  self.currentBidLabel = [self buildLabelWithText:@""];
  self.timeLeftLabelSeparator = [self buildSubSeparatorLine];
  self.timeLeftLabel = [self buildLabelWithText:@""];
  [self setupConstraints];
  return self;
}

- (void)setListing:(Listing *)listing {
  [self.referenceRateLabel setText:[NSString stringWithFormat:@"Reference rate: $%i", listing.referenceRate]];
  [self.currentBidLabel setText:[NSString stringWithFormat:@"Current bid: $%i", 50]];
  [self.timeLeftLabel setText:[NSString stringWithFormat:@"Time left: %@", @"1h 20m"]];
}

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;
  self.basicInfoLabel = [self buildLabelWithText:@"Basic Information"];
  self.basicInfoLabel.font = [UIFont smallBoldFont];
  self.referenceRateLabelSeparator = [self buildSubSeparatorLine];
  self.referenceRateLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Reference rate: $%i", listing.referenceRate]];
  self.currentBidLabelSeparator = [self buildSubSeparatorLine];
  self.currentBidLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Current bid: $%i", 50]];
  self.timeLeftLabelSeparator = [self buildSubSeparatorLine];
  self.timeLeftLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Time left: %@", @"1h 20m"]];
  [self setupConstraints];
  return self;
}

- (void)setupConstraints {
  [self.basicInfoLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.mas_top).with.offset(VERTICAL_OFFSET);
      [self setupHorizontalConstraint:maker];
  }];

  [self.referenceRateLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.basicInfoLabel.mas_bottom).with.offset(VERTICAL_OFFSET);
      [self setupSeparatorConstraint:maker];
  }];

  [self.referenceRateLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.referenceRateLabelSeparator.mas_bottom).with.offset(VERTICAL_OFFSET);
      [self setupHorizontalConstraint:maker];
  }];

  [self.currentBidLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.referenceRateLabel.mas_bottom).with.offset(VERTICAL_OFFSET);
      [self setupSeparatorConstraint:maker];
  }];

  [self.currentBidLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.currentBidLabelSeparator.mas_bottom).with.offset(VERTICAL_OFFSET);
      [self setupHorizontalConstraint:maker];
  }];

  [self.timeLeftLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.currentBidLabel.mas_bottom).with.offset(VERTICAL_OFFSET);
      [self setupSeparatorConstraint:maker];
  }];

  [self.timeLeftLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.timeLeftLabelSeparator.mas_bottom).with.offset(VERTICAL_OFFSET);
      [self setupHorizontalConstraint:maker];
  }];
}


@end