#import <Foundation/Foundation.h>

@interface ComponentBuilder : NSObject
+ (UIBarButtonItem *)createBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
@end