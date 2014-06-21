#import <Foundation/Foundation.h>

@interface Address : NSObject
@property(nonatomic, strong, getter=getId) NSString *id;
@property(nonatomic, strong) NSString *street;
@property(nonatomic, strong) NSString *suburb;
@property(nonatomic, strong) NSString *city;
@property(nonatomic, strong) NSString *state;
@property(nonatomic, strong) NSString *postcode;
@property(nonatomic, strong) NSString *country;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

- (instancetype)initWithString:(NSString *)address;

- (id)initFromDictionary:(NSDictionary *)dictionary;
@end