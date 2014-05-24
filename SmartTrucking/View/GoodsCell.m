#import "GoodsCell.h"
#import "Masonry.h"
#import "Goods.h"

@interface GoodsCell ()
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *fromLabel;
@property(nonatomic, strong) UILabel *toLabel;
@property(nonatomic, strong) UILabel *pickUpTimeLabel;
@property(nonatomic, strong) UILabel *arriveTimeLabel;
@property(nonatomic, strong) UILabel *priceLabel;
@property(nonatomic, strong) UIImageView *truckImage;
@property(nonatomic, strong) UILabel *weightLabel;
@end

@implementation GoodsCell {

}

- (id)init {
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GoodsCell"];
  if (!self) return nil;
//  self.nameLabel = [self createLabelWith:[UIFont goodsLocationFont]];
  self.fromLabel = [self createLabelWith:[UIFont goodsLocationFont]];
  self.toLabel = [self createLabelWith:[UIFont goodsLocationFont]];
  self.truckImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"truck"]];
  [self.contentView addSubview:self.truckImage];
  self.pickUpTimeLabel = [self createLabel];
  self.arriveTimeLabel = [self createLabel];
  self.priceLabel = [self createLabel];
  [self.priceLabel setTextColor:[UIColor textColorPrice]];
  self.weightLabel = [self createLabel];
  [self layout];
  return self;
}

- (void)layout {
  [self.fromLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
    maker.top.equalTo(self.mas_top).with.offset(10);
    maker.left.equalTo(self.mas_left).with.offset(10);
  }];
  [self.pickUpTimeLabel mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.fromLabel.mas_bottom).with.offset(5);
    maker.left.equalTo(self.mas_left).with.offset(10);
  }];
  [self.weightLabel mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.pickUpTimeLabel.mas_bottom).with.offset(15);
    maker.left.equalTo(self.mas_left).with.offset(10);
  }];
  [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.weightLabel.mas_top);
    maker.left.equalTo(self.weightLabel.mas_right).with.offset(10);
  }];
  [self.truckImage mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.mas_top).with.offset(15);
    maker.centerX.equalTo(self.mas_centerX);
  }];
  [self.toLabel mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.mas_top).with.offset(10);
    maker.right.equalTo(self.mas_right).with.offset(-10);
  }];
  [self.arriveTimeLabel mas_makeConstraints:^(MASConstraintMaker *maker){
    maker.top.equalTo(self.toLabel.mas_bottom).with.offset(5);
    maker.right.equalTo(self.mas_right).with.offset(-10);
  }];
}

- (void)setGoods:(Goods *)goods{
  [self.nameLabel setText:goods.name];
  [self.fromLabel setText:goods.fromSuburb];
  [self.toLabel setText:goods.toSuburb];
  [self.pickUpTimeLabel setText:goods.formattedPickupTime];
  [self.arriveTimeLabel setText:goods.formattedArriveTime];
  [self.weightLabel setText:[NSString stringWithFormat:@"重量: %.1f吨", goods.weight]];
  [self.priceLabel setText:[NSString stringWithFormat:@"$%i", goods.price]];
};

- (UILabel *)createLabel {
  UILabel *label = UILabel.new;
  [label setTextColor:[UIColor textColorDark]];
  [label setFont:[UIFont goodsListFont]];
  [self.contentView addSubview:label];
  return label;
}

- (UILabel *)createLabelWith:(UIFont *)font {
  UILabel *label = UILabel.new;
  [label setTextColor:[UIColor textColorDark]];
  [label setFont:font];
  [self.contentView addSubview:label];
  return label;
}
@end