#import <Foundation/Foundation.h>

@class Listing;


@interface PlaceBidView : UIView
- (instancetype)initWithListing:(Listing *)listing;

- (NSString *)bidValue;
@end