#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray *numberArray = [NSMutableArray new];
    NSMutableArray *stringArray = [NSMutableArray new];
    NSMutableArray *resultArray = [NSMutableArray new];
    
    if (array.count == 0 ||array == nil || ![array.firstObject isKindOfClass:NSArray.class]) {
        return @[];
    }
    
    for (int i = 0; i < array.count; i++) {
        for (NSUInteger j = 0; j < array[i].count; j++) {
            if ([array[i][j] isKindOfClass:NSNumber.class]) {
                [numberArray addObject:array[i][j]];
            } else if ([array[i][j] isKindOfClass:NSString.class]) {
                [stringArray addObject:array[i][j]];
            } else {
                return @[];
            }
        }
    }
    
    NSArray *numberArraySorted = [numberArray sortedArrayUsingSelector:@selector(compare:)];
    NSArray *stringArraySorted = [stringArray sortedArrayUsingSelector:@selector(compare:)];
    
    if (stringArray.count == 0) {
        [resultArray addObjectsFromArray:numberArraySorted];
    } else if (numberArray.count == 0) {
        [resultArray addObjectsFromArray:stringArraySorted];
    } else {
        [resultArray insertObject:numberArraySorted atIndex:0];
        [resultArray insertObject:stringArraySorted atIndex:1];

    }
    
    return resultArray;
}

@end
