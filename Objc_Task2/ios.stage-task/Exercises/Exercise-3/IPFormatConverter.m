#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    
    NSMutableArray *mutableNumbersArray = [[NSMutableArray alloc] initWithArray:numbersArray];
    NSString *ipString = [NSString string];

    
    if (numbersArray.count == 0 || numbersArray.count > 4 || numbersArray == nil) {
        return @"";
    }
    
    if (numbersArray.count < 4 ) {
          for (int i = 0; i < 4; i++) {
              [mutableNumbersArray addObject:@0];
          }
    }

    for (int i = 0; i < 4; i++) {
    
        if ([mutableNumbersArray[i] integerValue] < 0) {
            return @"Negative numbers are not valid for input.";
        }
        if ([mutableNumbersArray[i] integerValue] > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
    }
        
    ipString = [NSString stringWithFormat:@"%d.%d.%d.%d", [mutableNumbersArray[0] intValue], [mutableNumbersArray[1] intValue], [mutableNumbersArray[2] intValue], [mutableNumbersArray[3] intValue]];
    
    return ipString;
}

@end
