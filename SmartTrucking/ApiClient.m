#import "ApiClient.h"
#import "AFHTTPRequestOperationManager.h"
#import "Listing.h"
#import "Address.h"
#import "User.h"
#import <AFNetworking/AFNetworking.h>

@interface ApiClient ()
@property(nonatomic, strong) AFHTTPRequestOperationManager *requestOperationManager;
@end

@implementation ApiClient {

}

static ApiClient *sharedInstance;

+ (ApiClient *)client {
  static dispatch_once_t oneToken;

  dispatch_once(&oneToken, ^{
      NSString *serverProtocol = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Server Protocol"];
      NSString *serverAddress = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Server Address"];
      sharedInstance = [[ApiClient alloc] initWithServer:serverAddress andProtocol: serverProtocol];
  });

  return sharedInstance;
}

- (void)getUserBy:(NSString *)userId WithSuccess:(void (^)(User *user))successBlock error: (void(^)(NSError *error))errorBlock{
  [_requestOperationManager GET:[NSString stringWithFormat:@"/users/%@", userId]
    parameters:nil
    success:^(AFHTTPRequestOperation *operation, id response) {
      User *user = [[User alloc] initWithDictionary:response];
      successBlock(user);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error){
      errorBlock(error);
    }
  ];
}

- (void)addListing: (Listing *)listing WithSuccess:(void(^)())successBlock error: (void(^)(NSError *error))errorBlock {
  [_requestOperationManager POST:@"/listings"
     parameters:@{@"from_address_id": listing.pickupAddress.id,
     @"to_address_id": listing.arriveAddress.id,
     @"user_id": listing.userId,
     @"referenceRate": [NSNumber numberWithInt:listing.referenceRate],
     @"weight": listing.weight?:@"0",
     @"length": listing.length?:@"0",
     @"width": listing.width?:@"0",
     @"height": listing.height?:@"0",
     @"pick_up_time": listing.pickupTime,
     @"arrive_time": listing.arriveTime,
     @"bid_ending_time": listing.bidEndingTime,
     @"vehicle_type": listing.vehicleType?:@"Van",
     @"job_number": listing.jobNumber,
     @"special_carrying_permit_required": [NSNumber numberWithBool:listing.specialCarryingPermitRequired],
     @"pallet_jack_required": [NSNumber numberWithBool:listing.palletJackRequired],
     @"tail_gate": listing.tailgate?:@"Not Required"}
     success:^(AFHTTPRequestOperation *operation, id response){
       successBlock();
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error){
       errorBlock(error);
     }];
}

- (void)getAllListingsWithSuccess:(void (^)(NSArray *result))successBlock error:(void(^)(NSError *error))errorBlock {
  [_requestOperationManager GET:@"/listings"
     parameters:nil
     success:^(AFHTTPRequestOperation *operation, id response) {
       NSMutableArray *result = [[NSMutableArray alloc]init];
       for(NSDictionary *goodDictionary in response){
          Listing *listing = [[Listing alloc] initWithDictionary:goodDictionary];
         [result addObject:listing];
       }
       successBlock(result);
     }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       errorBlock(error);
     }
  ];
};

- (instancetype)initWithServer:(NSString *)server andProtocol: (NSString *)protocol{
  self = [super init];
  if (self) {
    NSString *url = [NSString stringWithFormat:@"%@://%@", protocol, server];
    _requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
  }
  return self;
}
@end