#import "ApiClient.h"
#import "AFHTTPRequestOperationManager.h"
#import "Listing.h"
#import "User.h"
#import <AFNetworking/AFNetworking.h>
#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>

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

- (void)getUserBy:(NSString *)username WithSuccess:(void (^)(User *user))successBlock error: (void(^)(NSError *error))errorBlock{
  [_requestOperationManager GET:[NSString stringWithFormat:@"/users/%@", username]
    parameters:nil
    success:^(AFHTTPRequestOperation *operation, id response) {
      User *user = [[User alloc] initWithDictionary:response[0]];
      successBlock(user);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error){
      errorBlock(error);
    }
  ];
}

- (void)addListing: (Listing *)listing WithSuccess:(void(^)())successBlock error: (void(^)(NSError *error))errorBlock {
  [_requestOperationManager POST:@"/listings"
     parameters:[listing toParameters]
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
       NSArray *listingArray = [response map:(^id(NSDictionary *dictionary) {
         return [[Listing alloc] initWithDictionary:dictionary];
       })];
       successBlock(listingArray);
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