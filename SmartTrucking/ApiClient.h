#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;

@interface ApiClient : NSObject
+ (ApiClient *)client;

- (NSArray *)getAllGoods;
@end