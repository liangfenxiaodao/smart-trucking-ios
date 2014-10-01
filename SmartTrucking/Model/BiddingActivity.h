#import <Foundation/Foundation.h>

@interface BiddingActivity : NSObject
@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSDate *biddingTime;
@property(nonatomic) NSNumber *biddingValue;
@property(nonatomic, strong) NSString *bidderId;
@property(nonatomic, strong) NSString *bidderName;
@property(nonatomic) BOOL isWinner;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end