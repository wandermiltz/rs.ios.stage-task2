#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    NSInteger countDiff = 0;
    
    for (int i = 0; i < array.count; i++) {
        
       for (int j = i + 1; j < array.count; j++) {
           
           if (abs(array[i].intValue - array[j].intValue) == number.intValue) {
               countDiff++;
           }
       }
   }
   return countDiff;
}

@end
