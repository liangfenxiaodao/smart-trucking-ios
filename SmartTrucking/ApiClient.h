#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;
@class Listing;

@interface ApiClient : NSObject
+ (ApiClient *)client;

- (void)getUserBy:(NSString *)userId WithSuccess:(void (^)())successBlock error:(void (^)(NSError *error))errorBlock;

- (void)addListing:(Listing *)listing WithSuccess:(void (^)())successBlock error:(void (^)(NSError *error))errorBlock;

- (void)getAllListingsWithSuccess:(void (^)(NSArray *result))successBlock error:(void (^)(NSError *error))errorBlock;
@end