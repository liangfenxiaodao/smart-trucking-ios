#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;

@interface ApiClient : NSObject
+ (ApiClient *)client;

- (void)getAllGoodsWithSuccess:(void (^)(NSArray *result))successBlock error:(void (^)(NSError *error))errorBlock;
@end