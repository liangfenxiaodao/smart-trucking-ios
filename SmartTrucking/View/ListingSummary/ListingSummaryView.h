#import <Foundation/Foundation.h>

@class Listing;
@class ListingSummaryViewController;

@interface ListingSummaryView : UIView
- (id)initWithListing:(Listing *)listing andTarget:(ListingSummaryViewController *)target;
@end