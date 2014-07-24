#import "PlaceBidView.h"
#import "Listing.h"
#import "PlaceBidViewController.h"
#import "DashedLine.h"
#import "Masonry.h"
#import "AbstractListingSubView.h"

#define HORIZONTAL_OFFSET 20
#define VERTICAL_OFFSET 10

@interface PlaceBidView ()
@property(nonatomic, strong) UIScrollView *contentView;
@property(nonatomic, strong) UILabel *currentBidLabel;
@property(nonatomic, strong) DashedLine *timeLeftLabelSeparator;
@property(nonatomic, strong) UILabel *timeLeftLabel;
@end

@implementation PlaceBidView {

}
- (id)initWithListing:(Listing *)listing andTarget:(PlaceBidViewController *)target {
  self = [super init];
  if (!self) return nil;

  self.contentView = [[UIScrollView alloc] init];
  [self.contentView setBackgroundColor:[UIColor buildColorWithRed:236 green:236 blue:236]];
  [self addSubview:self.contentView];

  self.currentBidLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Current bid: $%i", 50]];
  self.timeLeftLabelSeparator = [self buildSubSeparatorLine];
  self.timeLeftLabel = [self buildLabelWithText:[NSString stringWithFormat:@"Time left: %@", @"1h 20m"]];

  [self setupConstraints];
  return self;
}

- (void)setupConstraints {
  [self.contentView mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.edges.mas_equalTo(self);
  }];

  [self.currentBidLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self).with.offset(VERTICAL_OFFSET);
      maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
      maker.right.equalTo(self);
  }];

  [self.timeLeftLabelSeparator mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.currentBidLabel.mas_bottom).with.offset(VERTICAL_OFFSET);
      maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
      maker.right.equalTo(self);
      maker.height.mas_equalTo(1);
  }];

  [self.timeLeftLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.timeLeftLabelSeparator.mas_bottom).with.offset(VERTICAL_OFFSET);
      maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
      maker.right.equalTo(self);
      maker.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
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

- (DashedLine *)buildSubSeparatorLine {
  DashedLine *dashedLine = [[DashedLine alloc] init];
  [self.contentView addSubview:dashedLine];
  return dashedLine;
}

@end