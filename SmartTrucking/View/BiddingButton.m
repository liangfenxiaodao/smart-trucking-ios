#import "BiddingButton.h"
#import "Masonry.h"

@interface BiddingButton ()
@property(nonatomic, strong) UIButton *biddingButton;
@property(nonatomic, strong) ListingSummaryViewController *delegate;
@end

@implementation BiddingButton {

}

- (id)initWithDelegate:(ListingSummaryViewController *)delegate {
  self = [super initWithFrame:CGRectMake(0, 0, 320, 60)];
  if (!self) return nil;
  self.delegate = delegate;
  self.biddingButton = [self createBiddingButton];
  [self addSubview:self.biddingButton];
  [self.biddingButton mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.mas_top);
    maker.left.equalTo(self.mas_left).with.offset(10);
    maker.right.equalTo(self.mas_right).with.offset(-10);
  }];
  return self;
}

- (UIButton*)createBiddingButton {
  UIButton *biddingButton = [UIButton buttonWithType:UIButtonTypeCustom];
  biddingButton.backgroundColor = [UIColor buildColorWithRed:142 green:198 blue:63];
  biddingButton.titleLabel.font = [UIFont buttonFont];
  [biddingButton setTitle:@"Place bid" forState:UIControlStateNormal];
  [biddingButton setAccessibilityIdentifier:@"BidButton"];
  [biddingButton addTarget:self.delegate action:@selector(placeBidding) forControlEvents:UIControlEventTouchUpInside];
  return biddingButton;
}

@end