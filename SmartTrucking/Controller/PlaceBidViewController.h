//
//  PlaceBidViewController.h
//  SmartTrucking
//
//  Created by Jacky Li on 23/9/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Listing;
@class ListingBasicInfoView;

@interface PlaceBidViewController : UIViewController
@property(strong, nonatomic) IBOutlet ListingBasicInfoView *listingBasicInfoView;

- (id)initWithListing:(Listing *)listing;
@end
