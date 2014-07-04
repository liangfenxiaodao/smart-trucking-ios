#import <Foundation/Foundation.h>
#import "Masonry.h"

@class DashedLine;

#define HORIZONTAL_OFFSET 20

@interface AbstractListingSubView : UIView
- (UILabel *)buildLabelWithText:(NSString *)text;

- (DashedLine *)buildSubSeparatorLine;

- (void)setupSeparatorConstraint:(MASConstraintMaker *)maker;

- (void)setupHorizontalConstraint:(MASConstraintMaker *)maker;
@end