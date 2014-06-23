#import <Foundation/Foundation.h>

@class Listing;

@interface ListingSummaryViewController : UITableViewController
- (id)initWithListing:(Listing *)listing;

- (void)placeBidding;
@end