#import <Foundation/Foundation.h>
#import "FXForms.h"

@class ListingsMapViewController;

@interface AddListingViewController : FXFormViewController
@property (nonatomic, strong) ListingsMapViewController *delegate;
@end