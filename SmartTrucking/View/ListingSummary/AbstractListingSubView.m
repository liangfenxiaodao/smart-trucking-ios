#import "AbstractListingSubView.h"
#import "DashedLine.h"
#import "Masonry.h"

@implementation AbstractListingSubView {

}

- (UILabel *)buildLabelWithText:(NSString *)text {
  UILabel *label = [[UILabel alloc] init];
  label.text = text;
  label.textColor = [UIColor textColor];
  label.font = [UIFont smallFont];
  [self addSubview:label];
  return label;
}

- (DashedLine *)buildSubSeparatorLine {
  DashedLine *dashedLine = [[DashedLine alloc] init];
  [self addSubview:dashedLine];
  return dashedLine;
}

- (void)setupSeparatorConstraint:(MASConstraintMaker *)maker {
  [self setupHorizontalConstraint:maker];
  maker.height.mas_equalTo(1);
}


- (void)setupHorizontalConstraint:(MASConstraintMaker *)maker {
  maker.left.equalTo(self).with.offset(HORIZONTAL_OFFSET);
  maker.right.equalTo(self);
}

@end