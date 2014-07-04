#import "ListingSummaryView.h"
#import "Masonry.h"
#import "Listing.h"
#import "ListingSpecificView.h"
#import "ListingPositionView.h"
#import "ListingBasicInfoView.h"

#define HORIZONTAL_OFFSET 20


@interface ListingSummaryView ()
@property(nonatomic, strong) UIScrollView *contentView;
@property(nonatomic, strong) ListingSpecificView *listingSpecificView;
@property(nonatomic, strong) ListingPositionView *listingPositionView;
@property(nonatomic, strong) ListingBasicInfoView *listingBasicInfoView;
@end

@implementation ListingSummaryView {

}

- (id)initWithListing:(Listing *)listing {
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
    maker.height.equalTo(@110);
  }];

  [self.listingPositionView mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.listingBasicInfoView.mas_bottom).with.offset(10);
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

@end