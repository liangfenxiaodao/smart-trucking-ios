#import <Foundation/Foundation.h>
#import "AbstractListingSubView.h"

@class Listing;

@interface ListingBasicInfoView : AbstractListingSubView
- (void)setListing:(Listing *)listing;

- (id)initWithListing:(Listing *)listing;
@end