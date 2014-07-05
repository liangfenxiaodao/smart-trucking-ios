#import <Foundation/Foundation.h>
#import "Masonry.h"

@class DashedLine;

#define VERTICAL_OFFSET 10
#define HORIZONTAL_OFFSET 20

@interface AbstractListingSubView : UIView

@property(nonatomic, strong) NSMutableArray *labels;

- (UILabel *)buildLabelWithText:(NSString *)text;

- (DashedLine *)buildSubSeparatorLine;

- (void)setupSeparatorConstraint:(MASConstraintMaker *)maker;

- (void)setupHorizontalConstraint:(MASConstraintMaker *)maker;

- (int)viewHeight;
@end