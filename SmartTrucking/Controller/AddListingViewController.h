#import <Foundation/Foundation.h>
#import "FXForms.h"

@class ListingsMapViewController;
@class User;

@interface AddListingViewController : FXFormViewController

- (id)initWithUser:(User *)user delegate:(ListingsMapViewController *)delegate;
@end