#import "ListingSummaryView.h"
#import "Masonry.h"
#import "Listing.h"
#import "ListingSpecificView.h"
#import "ListingPositionView.h"
#import "ListingBasicInfoView.h"
#import "ListingSummaryViewController.h"
#import "ListingSummaryViewController.h"
#import "BiddingButton.h"
#import "ListingSummaryViewController.h"

#define HORIZONTAL_OFFSET 20


@interface ListingSummaryView ()
@property(nonatomic, strong) UIScrollView *contentView;
@property(nonatomic, strong) ListingSpecificView *listingSpecificView;
@property(nonatomic, strong) ListingPositionView *listingPositionView;
@property(nonatomic, strong) ListingBasicInfoView *listingBasicInfoView;
@property(nonatomic, strong) BiddingButton *biddingButton;
@end

@implementation ListingSummaryView {

}

- (id)initWithListing:(Listing *)listing andDelegate:(ListingSummaryViewController *)delegate {
  self = [super init];
  if (!self) return nil;

  self.contentView = [[UIScrollView alloc] init];
  [self.contentView setBackgroundColor:[UIColor buildColorWithRed:236 green:236 blue:236]];
  [self addSubview:self.contentView];

  self.listingBasicInfoView = [[ListingBasicInfoView alloc] initWithListing:listing];
  self.listingBasicInfoView.backgroundColor = [UIColor whiteColor];
  [self.contentView addSubview:self.listingBasicInfoView];

  self.listingPositionView = [[ListingPositionView alloc] initWithListing:listing];
  self.listingPositionView.backgroundColor = [UIColor whiteColor];
  [self.contentView addSubview:self.listingPositionView];

  self.listingSpecificView = [[ListingSpecificView alloc] initWithListing:listing];
  self.listingSpecificView.backgroundColor = [UIColor whiteColor];
  [self.contentView addSubview:self.listingSpecificView];

  self.biddingButton = [[BiddingButton alloc] initWithDelegate:delegate];
  [self.contentView addSubview:self.biddingButton];
  [self setupConstraints];
  return self;
}

- (void)setupConstraints {
  [self.contentView mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.edges.mas_equalTo(self);
  }];

  [self.listingBasicInfoView mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.contentView);
    maker.left.equalTo(self);
    maker.right.equalTo(self);
    maker.height.mas_equalTo([self.listingBasicInfoView viewHeight]);
  }];

  [self.listingPositionView mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.listingBasicInfoView.mas_bottom).with.offset(10);
    maker.left.equalTo(self);
    maker.right.equalTo(self);
    maker.height.mas_equalTo([self.listingPositionView viewHeight]);
  }];

  [self.listingSpecificView mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.listingPositionView.mas_bottom).with.offset(10);
    maker.left.equalTo(self);
    maker.right.equalTo(self);
    maker.height.mas_equalTo([self.listingSpecificView viewHeight]);
  }];

  [self.biddingButton mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.listingSpecificView.mas_bottom).with.offset(10);
    maker.left.equalTo(self).with.offset(10);
    maker.right.equalTo(self).with.offset(-10);
    maker.height.mas_equalTo(30);
    maker.bottom.equalTo(self.contentView.mas_bottom).with.offset(-20);
  }];
}

@end