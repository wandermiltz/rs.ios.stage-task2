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
    
    NSArray *numberArraySortedAsc = [numberArray sortedArrayUsingSelector:@selector(compare:)];
    NSArray *stringArraySortedAsc = [stringArray sortedArrayUsingSelector:@selector(compare:)];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSLog(@"%@", [stringArray description]);
    NSLog(@"%@", [numberArray description]);
            
    if (stringArray.count == 0) {
        [resultArray addObjectsFromArray:numberArraySortedAsc];
    } else if (numberArray.count == 0) {
        [resultArray addObjectsFromArray:stringArraySortedAsc];
    } else {
        [stringArray sortUsingDescriptors:sortDescriptors];
        [resultArray insertObject:numberArraySortedAsc atIndex:0];
        [resultArray insertObject:stringArray atIndex:1];
    }
    NSLog(@"%@", [resultArray description]);
    return resultArray;
}

@end
