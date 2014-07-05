#import <Foundation/Foundation.h>

@class Listing;

@interface ListingSummaryViewController : UIViewController
- (id)initWithListing:(Listing *)listing;

- (void)placeBidding;
@end