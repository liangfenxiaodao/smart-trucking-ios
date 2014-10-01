#import "ApiClient.h"
#import "AFHTTPRequestOperationManager.h"
#import "Listing.h"
#import "User.h"
#import <AFNetworking/AFNetworking.h>
#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>

@interface ApiClient ()
@property(nonatomic, strong) AFHTTPRequestOperationManager *operationManager;
@end

@implementation ApiClient {

}

static ApiClient *sharedInstance;

+ (ApiClient *)client {
  static dispatch_once_t oneToken;

  dispatch_once(&oneToken, ^{
      NSString *serverProtocol = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Server Protocol"];
      NSString *serverAddress = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Server Address"];
      sharedInstance = [[ApiClient alloc] initWithServer:serverAddress andProtocol:serverProtocol];
  });

  return sharedInstance;
}

- (void)getUserBy:(NSString *)username withSuccess:(void (^)(User *user))successBlock error:(void (^)(NSError *error))errorBlock {
  [_operationManager GET:[NSString stringWithFormat:@"/users/%@", username]
              parameters:nil
                 success:^(AFHTTPRequestOperation *operation, id response) {
                     User *user = [[User alloc] initWithDictionary:response[0]];
                     [[_operationManager requestSerializer] setValue:[user id] forHTTPHeaderField:@"user-id"];
                     [[_operationManager requestSerializer] setValue:[user username] forHTTPHeaderField:@"user-name"];
                     successBlock(user);
                 }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     errorBlock(error);
                 }
  ];
}

- (void)placeBidWithPrice:(NSString *)price onListing:(NSString *)listingId
                                              success:(void (^)(Listing *listing))successBlock
                                              failure:(void (^)(NSError *error))errorBlock {
  [_operationManager POST:[NSString stringWithFormat:@"/listings/%@/bidding_activities", listingId]
               parameters:@{@"bidding_value" : price}
                  success:^(AFHTTPRequestOperation *operation, id response) {
                      successBlock([[Listing alloc] initWithDictionary:response]);
                  }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                      errorBlock(error);
                  }];
}

- (void)addListing:(Listing *)listing success:(void (^)())successBlock failure:(void (^)(NSError *error))errorBlock {
  [_operationManager POST:@"/listings"
               parameters:[listing toParameters]
                  success:^(AFHTTPRequestOperation *operation, id response) {
                      successBlock();
                  }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                      errorBlock(error);
                  }];
}

- (void)getListingBy:(NSString *)listingId success:(void (^)(Listing *listing))success failure:(void (^)(NSError *error))errorBlock {
  [_operationManager GET:[NSString stringWithFormat:@"/listings/%@", listingId]
              parameters:nil
                 success:^(AFHTTPRequestOperation *operation, id response) {
                     success([[Listing alloc] initWithDictionary:response]);
                 }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     errorBlock(error);
                 }
  ];
}

- (void)getAllListingsWithSuccess:(void (^)(NSArray *result))successBlock error:(void (^)(NSError *error))errorBlock {
  [_operationManager GET:@"/listings"
              parameters:nil
                 success:^(AFHTTPRequestOperation *operation, id response) {
                     NSArray *listingArray = [response map:(^id(NSDictionary *dictionary) {
                         return [[Listing alloc] initWithDictionary:dictionary];
                     })];
                     successBlock(listingArray);
                 }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     errorBlock(error);
                 }
  ];
};

- (instancetype)initWithServer:(NSString *)server andProtocol:(NSString *)protocol {
  self = [super init];
  if (self) {
    NSString *url = [NSString stringWithFormat:@"%@://%@", protocol, server];
    _operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
  }
  return self;
}
@end