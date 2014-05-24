#import "ApiClient.h"
#import "AFHTTPRequestOperationManager.h"
#import "Goods.h"
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

- (void)getAllGoodsWithSuccess:(void(^)(NSArray *result))successBlock error:(void(^)(NSError *error))errorBlock {
  [_requestOperationManager GET:@"/goods"
     parameters:nil
     success:^(AFHTTPRequestOperation *operation, id response) {
       NSMutableArray *result = [[NSMutableArray alloc]init];
       for(NSDictionary *goodDictionary in response){
          Goods *good = [[Goods alloc] initWithDictionary:goodDictionary];
         [result addObject:good];
         NSLog(@"%@", good);
       }
       successBlock(result);
     }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       errorBlock(error);
     }
  ];
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