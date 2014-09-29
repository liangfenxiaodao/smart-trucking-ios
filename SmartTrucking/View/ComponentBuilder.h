#import <Foundation/Foundation.h>

@interface ComponentBuilder : NSObject
+ (UIBarButtonItem *)createNavItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+ (UITextField *)numericTextField;
@end