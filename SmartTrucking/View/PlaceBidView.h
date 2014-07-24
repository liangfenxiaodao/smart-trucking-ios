#import <Foundation/Foundation.h>

@class DashedLine;
@class Listing;
@class PlaceBidViewController;

@interface PlaceBidView : UIView
- (id)initWithListing:(Listing *)listing andTarget:(PlaceBidViewController *)target;
@end