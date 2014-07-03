#import <Foundation/Foundation.h>

@interface UIColor (SmartTrucking)
+ (UIColor *)textColorDark;

+ (UIColor *)textColorPrice;

+ (UIColor *)textColor;

+ (UIColor *)buildSimpleColor:(int)value;

+ (UIColor *)buildColorWithRed:(int)red green:(int)green blue:(int)blue;
@end