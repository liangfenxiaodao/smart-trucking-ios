#import "ListingSummaryView.h"
#import "Masonry.h"
#import "Listing.h"
#import "DashedLine.h"
#import "ListingSpecificView.h"

#define HORIZONTAL_OFFSET 20


@interface ListingSummaryView ()
@property(nonatomic, strong) UIScrollView *contentView;
@property(nonatomic, strong) UILabel *referenceRateLabel;
@property(nonatomic, strong) UILabel *currentBidLabel;
@property(nonatomic, strong) UILabel *timeLeftLabel;
@property(nonatomic, strong) UIView *positionSeparatorLine;
@property(nonatomic, strong) UILabel *positionLabel;
@property(nonatomic, strong) DashedLine *positionSubSeparatorLine;
@property (nonatomic, strong) ListingSpecificView *listingSpecificView;
@end

@implementation ListingSummaryView {

}

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;
  self.backgroundColor = [UIColor whiteColor];
  self.contentView = [[UIScrollView alloc] init];
  [self addSubview:self.contentView];

  self.referenceRateLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Reference rate: %i", listing.referenceRate]];
  self.currentBidLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Current bid: %i", 50]];
  self.timeLeftLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Time left: %@", @"1h 20m"]];
  self.listingSpecificView = [[ListingSpecificView alloc] initWithListing:listing];
  [self addSubview:self.listingSpecificView];
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

  [self.listingSpecificView mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.timeLeftLabel.mas_bottom);
    maker.left.equalTo(self);
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