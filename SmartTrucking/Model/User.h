#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic, strong) id id;
@property(nonatomic, strong) id firstName;
@property(nonatomic, strong) id lastName;
@property(nonatomic, strong) id isCustomer;
@property(nonatomic, strong) id username;
@property(nonatomic, strong) NSMutableArray *addresses;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end