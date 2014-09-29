#import "ListingsCell.h"
#import "Masonry.h"
#import "Listing.h"
#import "Address.h"

@interface ListingsCell ()
@property(nonatomic, strong) UILabel *pickupSuburbLabel;
@property(nonatomic, strong) UILabel *deliverySuburbLabel;
@property(nonatomic, strong) UILabel *pickUpTimeLabel;
@property(nonatomic, strong) UILabel *deliveryTimeLabel;
@property(nonatomic, strong) UILabel *priceLabel;
@property(nonatomic, strong) UIImageView *truckImage;
@property(nonatomic, strong) UILabel *weightLabel;
@property (nonatomic, strong) UILabel *volumeLabel;
@end

@implementation ListingsCell {

}

- (id)init {
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ListingsCell"];
  if (!self) return nil;
  self.pickupSuburbLabel = [self createLabelWith:[UIFont goodsLocationFont]];
  self.deliverySuburbLabel = [self createLabelWith:[UIFont goodsLocationFont]];
  self.truckImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"truck"]];
  [self.contentView addSubview:self.truckImage];
  self.pickUpTimeLabel = [self createLabel];
  self.deliveryTimeLabel = [self createLabel];
  self.priceLabel = [self createLabel];
  [self.priceLabel setTextColor:[UIColor textColorPrice]];
  self.volumeLabel = [self createLabel];
  self.weightLabel = [self createLabel];
  [self layout];
  return self;
}

- (void)layout {
  [self.pickupSuburbLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.mas_top).with.offset(10);
    maker.left.equalTo(self.mas_left).with.offset(10);
  }];
  [self.pickUpTimeLabel mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.pickupSuburbLabel.mas_bottom).with.offset(5);
    maker.left.equalTo(self.pickupSuburbLabel.mas_left);
  }];
  [self.volumeLabel mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.pickUpTimeLabel.mas_bottom).with.offset(15);
    maker.left.equalTo(self.pickupSuburbLabel.mas_left);
  }];
  [self.weightLabel mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.volumeLabel.mas_top);
    maker.centerX.equalTo(self.mas_centerX);
  }];
  [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.volumeLabel.mas_top);
    maker.right.equalTo(self.mas_right).with.offset(-30);
  }];
  [self.truckImage mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.mas_top).with.offset(15);
    maker.centerX.equalTo(self.mas_centerX);
  }];
  [self.deliverySuburbLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.mas_top).with.offset(10);
    maker.right.equalTo(self.mas_right).with.offset(-10);
  }];
  [self.deliveryTimeLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.deliverySuburbLabel.mas_bottom).with.offset(5);
    maker.right.equalTo(self.mas_right).with.offset(-10);
  }];
}

- (void)setGoods:(Listing *)listing {
  [self.pickupSuburbLabel setText:listing.pickupAddress.suburb];
  [self.deliverySuburbLabel setText:listing.deliveryAddress.suburb];
  [self.pickUpTimeLabel setText:listing.formattedPickupTime];
  [self.deliveryTimeLabel setText:listing.formattedDeliveryTime];
  [self.volumeLabel setText:[NSString stringWithFormat:@"%@", listing.volume]];
  [self.weightLabel setText:[NSString stringWithFormat:@"%@T", listing.weight]];
  [self.priceLabel setText:[NSString stringWithFormat:@"Rate: $%i", listing.referenceRate]];
};

- (UILabel *)createLabel {
  return [self createLabelWith:[UIFont smallFont]];
}

- (UILabel *)createLabelWith:(UIFont *)font {
  UILabel *label = UILabel.new;
  [label setTextColor:[UIColor textColorDark]];
  [label setFont:font];
  [self.contentView addSubview:label];
  return label;
}
@end