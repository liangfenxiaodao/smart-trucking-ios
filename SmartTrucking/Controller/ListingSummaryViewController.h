#import <Foundation/Foundation.h>

@class Listing;

@interface ListingSummaryViewController : UITableViewController
- (id)initWithListings:(Listing *)listings;
@end