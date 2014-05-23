#import "ApiClient.h"
#import "AFHTTPRequestOperationManager.h"
#import "Good.h"
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
    sharedInstance = [[ApiClient alloc] initWithServer:@"smart-trucking.herokuapp.com"];
  });

  return sharedInstance;
}

- (NSArray *)getAllGoods {
  __block NSMutableArray *result = [[NSMutableArray alloc]init];
  [_requestOperationManager GET:@"/goods"
     parameters:nil
     success:^(AFHTTPRequestOperation *operation, id response) {
        for(NSDictionary *goodDictionary in response){
          Good *good = [[Good alloc] initWithDictionary:goodDictionary];
          NSLog(@"%@", good);
        }
     }failure:^(AFHTTPRequestOperation *operation, NSError *error) {

     }
  ];
  return result;
};

- (instancetype)initWithServer:(NSString *)server {
  self = [super init];
  if (self) {
    NSString *url = [NSString stringWithFormat:@"http://%@", server];
    _requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
  }
  return self;
}
@end