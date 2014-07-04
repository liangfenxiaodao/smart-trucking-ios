#import <Foundation/Foundation.h>
#import "AbstractListingSubView.h"

@class Listing;

@interface ListingSpecificView : AbstractListingSubView

- (id)initWithListing:(Listing *)listing;
@end