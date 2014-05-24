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
  self.nameLabel = [self createLabel];
  self.fromLabel = [self createLabel];
  self.toLabel = [self createLabel];
  self.truckImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"truck"]];
  [self.contentView addSubview:self.truckImage];
  self.pickUpTimeLabel = [self createLabel];
  self.arriveTimeLabel = [self createLabel];
  self.priceLabel = [self createLabel];
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
  [self.pickUpTimeLabel setText:goods.pickUpTime];
  [self.arriveTimeLabel setText:goods.arriveTime];
  [self.weightLabel setText:@"Weight: 2T"];
  [self.priceLabel setText:[NSString stringWithFormat:@"Price: $%i", goods.price]];
};

- (UILabel *)createLabel {
  UILabel *label = UILabel.new;
  [label setTextColor:[UIColor textColorDark]];
  [label setFont:[UIFont goodsListFont]];
  [self.contentView addSubview:label];
  return label;
}
@end