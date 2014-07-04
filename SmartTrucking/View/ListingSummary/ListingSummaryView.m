#import "ListingSummaryView.h"
#import "Masonry.h"
#import "Listing.h"
#import "DashedLine.h"
#import "ListingSpecificView.h"
#import "ListingPositionView.h"
#import "ListingPositionView.h"

#define HORIZONTAL_OFFSET 20


@interface ListingSummaryView ()
@property(nonatomic, strong) UIScrollView *contentView;
@property(nonatomic, strong) UILabel *referenceRateLabel;
@property(nonatomic, strong) UILabel *currentBidLabel;
@property(nonatomic, strong) UILabel *timeLeftLabel;
@property (nonatomic, strong) ListingSpecificView *listingSpecificView;
@property(nonatomic, strong) ListingPositionView *listingPositionView;
@end

@implementation ListingSummaryView {

}

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;

  self.contentView = [[UIScrollView alloc] init];
  [self.contentView setBackgroundColor:[UIColor buildColorWithRed:236 green:236 blue:236]];
  [self addSubview:self.contentView];

  self.referenceRateLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Reference rate: %i", listing.referenceRate]];
  self.currentBidLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Current bid: %i", 50]];
  self.timeLeftLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Time left: %@", @"1h 20m"]];

  self.listingPositionView = [[ListingPositionView alloc] initWithListing:listing];
  self.listingPositionView.backgroundColor = [UIColor whiteColor];
  [self.contentView addSubview:self.listingPositionView];

  self.listingSpecificView = [[ListingSpecificView alloc] initWithListing:listing];
  self.listingSpecificView.backgroundColor = [UIColor whiteColor];
  [self.contentView addSubview:self.listingSpecificView];

  [self setupConstraints];
  [self layoutSubviews];
  return self;
}

- (void)setupConstraints {
  [self.contentView mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.edges.mas_equalTo(self);
  }];

  [self.referenceRateLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.contentView).with.offset(10);
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

  [self.listingPositionView mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.timeLeftLabel.mas_bottom).with.offset(5);
    maker.left.equalTo(self);
    maker.right.equalTo(self);
    maker.height.equalTo(@135);
  }];

  [self.listingSpecificView mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.listingPositionView.mas_bottom).with.offset(10);
    maker.left.equalTo(self);
    maker.right.equalTo(self);
    maker.height.equalTo(@215);
    maker.bottom.equalTo(self.contentView.mas_bottom).with.offset(-20);
  }];
}

- (UILabel *)buildLabelWithText:(NSString *)text {
  UILabel *label = [[UILabel alloc] init];
  label.text = text;
  label.textColor = [UIColor textColor];
  label.font = [UIFont smallFont];
  [self.contentView addSubview:label];
  return label;
}
@end