#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;
@class Listing;
@class User;

@interface ApiClient : NSObject
+ (ApiClient *)client;

- (void)getUserBy:(NSString *)username withSuccess:(void (^)(User *user))successBlock error:(void (^)(NSError *error))errorBlock;

- (void)placeBidWithPrice:(NSString *)price onListing:(NSString *)listingId success:(void (^)(Listing *listing))successBlock failure:(void (^)(NSError *error))errorBlock;

- (void)addListing:(Listing *)listing success:(void (^)())successBlock failure:(void (^)(NSError *error))errorBlock;

- (void)getListingBy:(NSString *)listingId success:(void (^)(Listing *listing))success failure:(void (^)(NSError *error))errorBlock;

- (void)getAllListingsWithSuccess:(void (^)(NSArray *result))successBlock error:(void (^)(NSError *error))errorBlock;
@end