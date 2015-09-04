//
//  main.m
//  OBJCTEST
//
//  Created by Chris Davis on 8/13/15.
//  Copyright (c) 2015 Chris Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PastToFast.h"

#define GETSEL(arg) (NSStringFromSelector(@selector(arg)))

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Test Order for Past to Fast Solutions
        NSArray *testOrder1 = @[
                                GETSEL(removeDuplicatesPast:),
                                GETSEL(removeDuplicatesWithRange:),
                                GETSEL(removeDuplicatesMap:),
                                GETSEL(removeDuplicatesWithMapReturnKeys:),
                                GETSEL(removeDuplicatesWithMapEnumerate:),
                                GETSEL(removeDuplicatesWithMapFast:),
                                GETSEL(removeDuplicatesWithMutableSet:),
                                GETSEL(removeDuplicatesSet:)
                               ];
        
        //Test Order without slow functions
        NSArray *testOrder2 = @[
                                GETSEL(removeDuplicatesMap:),
                                GETSEL(removeDuplicatesWithMapReturnKeys:),
                                GETSEL(removeDuplicatesWithMapEnumerate:),
                                GETSEL(removeDuplicatesWithMapFast:),
                                GETSEL(removeDuplicatesWithMutableSet:),
                                GETSEL(removeDuplicatesSet:)
                                ];
        //Test Order without slow functions
        NSArray *testOrder2A = @[
                                 GETSEL(removeDuplicatesSet:),
                                 GETSEL(removeDuplicatesWithMutableSet:),
                                 GETSEL(removeDuplicatesWithMapFast:),
                                 GETSEL(removeDuplicatesWithMapFast:),
                                 GETSEL(removeDuplicatesWithMutableSet:),
                                 GETSEL(removeDuplicatesSet:),
                                 GETSEL(removeDuplicatesSet:),
                                 GETSEL(removeDuplicatesWithMutableSet:),
                                 GETSEL(removeDuplicatesWithMapFast:),
                                 GETSEL(removeDuplicatesWithMapFast:),
                                 GETSEL(removeDuplicatesWithMutableSet:),
                                 GETSEL(removeDuplicatesSet:)
                                ];
        
        //Test Order for Paying the Toll
        NSArray *testOrder3 = @[
                                GETSEL(removeDuplicatesWithMapFast:),
                                GETSEL(removeDuplicatesPast:),
                                GETSEL(removeDuplicatesWithRange:),
                                GETSEL(removeDuplicatesMap:),
                                GETSEL(removeDuplicatesWithMapReturnKeys:),
                                GETSEL(removeDuplicatesWithMapEnumerate:),
                                GETSEL(removeDuplicatesWithMutableSet:),
                                GETSEL(removeDuplicatesSet:)
                               ];
        
        //Test functions with
        NSArray *testSizes = @[@10,
                               @100,
                               @1000,
                               @10000,
                               @100000,
                               @500000,
                               @1000000];
        
        const NSUInteger testSizeCount = [testSizes count];
        
        //Create test arrays
        NSMutableArray *testArrays = [NSMutableArray new];
        for(NSUInteger i = 0; i < testSizeCount; i++)
        {
            [testArrays addObject:[PastToFast getTestArrayWithSize:[testSizes[i] intValue]]];
        }
        
        NSArray *whichTestOrder = testOrder2A;
        const NSUInteger testCount = [whichTestOrder count];
        //Run tests over test arrays
        for(NSUInteger i = 0; i < testSizeCount; i++)
        {
            NSArray *testArray = testArrays[i];
            NSLog(@"Performing tests for Size(%lu)", [testArray count]);
            for(NSUInteger j = 0; j < testCount; j++)
            {
                NSDate *start = [NSDate date];
                NSArray *result = [PastToFast performTest:whichTestOrder[j] array:testArray];
                if(![PastToFast validateArray:result])
                {
                    NSLog(@"TEST FAILED: SEL(%@) Size(%lu)", whichTestOrder[j], [testArray count]);
                }
                else
                {
                    //NSLog(@"Test passed: SEL(%@) Size(%lu)", testOrder1[j], [testArray count]);
                }
                NSLog(@"    test completed: time(%f) sel(%@)", -[start timeIntervalSinceNow], whichTestOrder[j]);
            }
            NSLog(@"\n\n");
        }
//        NSLog(@"Running test 1::");
//        [test testArray:testArray];
//        NSLog(@"Running test 2::");
//        [test testArray:testArray2];
//        NSLog(@"Running test 3::");
//        [test testArray:testArray3];
//        NSLog(@"Running test 4::");
//        [test testArray:testArray4];
//        NSLog(@"Running test 5::");
//        [test testArray:testArray5];
//        NSLog(@"Running test 6::");
//        [test testArray:testArray6];
        
    }
    return 0;
}
