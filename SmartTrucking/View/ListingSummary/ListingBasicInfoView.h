#import <Foundation/Foundation.h>
#import "AbstractListingSubView.h"

@class Listing;

@interface ListingBasicInfoView : AbstractListingSubView
- (id)initWithListing:(Listing *)listing;
@end