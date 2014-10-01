#import "PlaceBidView.h"
#import "Listing.h"
#import "ListingBasicInfoView.h"
#import "ComponentBuilder.h"
#import "MoneyTextFieldDelegate.h"

@interface PlaceBidView ()
@property(nonatomic, strong) UIScrollView *contentView;
@property(nonatomic, strong) ListingBasicInfoView *listingBasicInfoView;
@property(nonatomic, strong) UILabel *biddingLabel;
@property(nonatomic, strong) UILabel *biddingPricingLabel;
@property(nonatomic, strong) UITextField *biddingField;
@property(nonatomic, strong) MoneyTextFieldDelegate *textFieldDelegate;
@end

@implementation PlaceBidView {

}

- (instancetype)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self)return nil;
  self.textFieldDelegate = [[MoneyTextFieldDelegate alloc]init];
  self.contentView = [[UIScrollView alloc] init];
  [self.contentView setBackgroundColor:[UIColor buildColorWithRed:236 green:236 blue:236]];
  [self addSubview:self.contentView];

  self.listingBasicInfoView = [[ListingBasicInfoView alloc] initWithListing:listing];
  self.listingBasicInfoView.backgroundColor = [UIColor whiteColor];
  [self.contentView addSubview:self.listingBasicInfoView];

  _biddingLabel = [[UILabel alloc] init];
  _biddingLabel.text = @"Place your bid:";
  _biddingLabel.font = [UIFont smallBoldFont];

  [self.contentView addSubview:_biddingLabel];

  _biddingPricingLabel = [[UILabel alloc] init];
  _biddingPricingLabel.text = @"($55.00 or more)";
  _biddingPricingLabel.font = [UIFont smallFont];

  [self.contentView addSubview:_biddingPricingLabel];

  _biddingField = [ComponentBuilder numericTextField];
  _biddingField.placeholder = @"0.00";
  _biddingField.delegate = self.textFieldDelegate;
  [self.contentView addSubview:_biddingField];
  [_biddingField becomeFirstResponder];

  [self layout];
  return self;
}

- (NSString *)bidValue {
  return self.biddingField.text;
}

- (void)layout {
  [self.contentView mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.edges.mas_equalTo(self);
  }];

  [self.listingBasicInfoView mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.contentView);
      maker.left.equalTo(self);
      maker.right.equalTo(self);
      maker.height.mas_equalTo([self.listingBasicInfoView viewHeight]);
  }];

  [self.biddingLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.listingBasicInfoView.mas_bottom).with.offset(20);
      maker.left.equalTo(self.contentView).with.offset(20);
      maker.width.equalTo(@100);
      maker.height.mas_equalTo(@20);
  }];

  [self.biddingPricingLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
      maker.top.equalTo(self.biddingLabel.mas_bottom);
      maker.left.equalTo(self.contentView).with.offset(20);
      maker.width.equalTo(@150);
      maker.height.mas_equalTo(@20);
  }];

  [self.biddingField mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.equalTo(self.listingBasicInfoView.mas_bottom).with.offset(20);
      make.left.equalTo(self.biddingPricingLabel.mas_right).with.offset(50);
      make.width.equalTo(@70);
      make.height.equalTo(@36.0);
  }];
}
@end