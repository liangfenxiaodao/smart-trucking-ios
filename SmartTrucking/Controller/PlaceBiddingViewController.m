//
//  PlaceBiddingViewController.m
//  SmartTrucking
//
//  Created by Jacky Li on 23/9/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "PlaceBiddingViewController.h"
#import "Listing.h"
#import "ComponentBuilder.h"
#import "ListingBasicInfoView.h"
#import "PlaceBidView.h"

@interface PlaceBiddingViewController ()
@property(nonatomic, strong) Listing *listing;
@end

@implementation PlaceBiddingViewController

- (id)initWithListing:(Listing *)listing {
  self = [super init];
  if (!self) return nil;
  self.listing = listing;
  [self setTitle:@"Place Bid"];
  self.navigationItem.leftBarButtonItem = [ComponentBuilder createNavItemWithTitle:@"Cancel" target:self action:@selector(cancel)];
  self.navigationItem.rightBarButtonItem = [ComponentBuilder createNavItemWithTitle:@"Continue" target:self action:@selector(save)];
  return self;
}

- (void)cancel {
  [self dismissViewControllerAnimated:YES completion:^{
  }];
}

- (void)save {

}

- (void)loadView {
  self.view = [[PlaceBidView alloc] initWithListing:self.listing];
}

@end
