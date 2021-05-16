#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    
    UInt8 reversedInt = 0;

    for (int i = 0; i < 8; i++) {

        reversedInt = reversedInt * 2;

        if (n % 2 == 1) {
            reversedInt++;
        }
        n = n / 2;
    }
    return reversedInt;
}
