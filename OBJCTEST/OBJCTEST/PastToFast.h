//
//  PastToFast.h
//  OBJCTEST
//
//  Created by Chris Davis on 8/26/15.
//  Copyright (c) 2015 Chris Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PastToFast : NSObject

+ (NSArray *)removeDuplicatesPast:(NSArray *)arr;

+ (NSArray *)removeDuplicatesWithRange:(NSArray *)arr;

+ (NSArray *)removeDuplicatesMap:(NSArray *)arr;

+ (NSArray *)removeDuplicatesWithMapReturnKeys:(NSArray *)arr;

+ (NSArray *)removeDuplicatesWithMapEnumerate:(NSArray *)arr;

+ (NSArray *)removeDuplicatesWithMapFast:(NSArray *)arr;

+ (NSArray *)removeDuplicatesWithMutableSet:(NSArray *)arr;

+ (NSArray *)removeDuplicatesSet:(NSArray *)arr;

+ (NSArray *)getTestArrayWithSize:(int)size;

+ (NSArray*)performTest:(NSString *)selector array:(NSArray *)arr;

+ (BOOL)validateArray:(NSArray *)arr;

@end
