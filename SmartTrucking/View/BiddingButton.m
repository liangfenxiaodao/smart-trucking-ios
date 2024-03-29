#import "BiddingButton.h"
#import "Masonry.h"

@interface BiddingButton ()
@property(nonatomic, strong) UIButton *biddingButton;
@property(nonatomic, strong) ListingSummaryViewController *target;
@end

@implementation BiddingButton {

}

- (id)initWithTarget:(ListingSummaryViewController *)target {
  self = [super initWithFrame:CGRectMake(0, 0, 320, 60)];
  if (!self) return nil;
  self.target = target;
  self.biddingButton = [self createBiddingButton];
  [self addSubview:self.biddingButton];
  [self.biddingButton mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.edges.mas_equalTo(self);
  }];
  return self;
}

- (UIButton*)createBiddingButton {
  UIButton *biddingButton = [UIButton buttonWithType:UIButtonTypeCustom];
  biddingButton.backgroundColor = [UIColor buildColorWithRed:142 green:198 blue:63];
  biddingButton.titleLabel.font = [UIFont buttonFont];
  [biddingButton setTitle:@"Place bid" forState:UIControlStateNormal];
  [biddingButton setAccessibilityIdentifier:@"BidButton"];
  [biddingButton addTarget:self.target action:@selector(placeBidding) forControlEvents:UIControlEventTouchUpInside];
  return biddingButton;
}

@end