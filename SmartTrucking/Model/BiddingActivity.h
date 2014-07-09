#import <Foundation/Foundation.h>

@interface BiddingActivity : NSObject
@property(nonatomic, strong) NSDate *biddingTime;
@property(nonatomic) int biddingValue;
@property(nonatomic, strong) NSString *bidderId;
@property(nonatomic, strong) NSString *bidderName;
@property(nonatomic) BOOL isWinner;
@end