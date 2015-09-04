//
//  PastToFast.m
//  OBJCTEST
//
//  Created by Chris Davis on 8/26/15.
//  Copyright (c) 2015 Chris Davis. All rights reserved.
//

#import "PastToFast.h"

#define UNIQUE_NUMBERS 8

@implementation PastToFast

+ (NSArray *)removeDuplicatesPast:(NSArray *)arr
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:arr];
    for(NSUInteger i = 0; i < [array count]; i++)
    {
        for(NSUInteger j = i + 1; j < [array count]; j++)
        {
            if(array[i] == array[j])
            {
                [array removeObjectAtIndex:j];
                j--;
            }
        }
    }
    return array;
}

+ (NSArray *)removeDuplicatesWithRange:(NSArray *)arr
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:arr];
    NSUInteger location = NSNotFound;
    for(NSUInteger i = 0; i < [array count]; i++)
    {
        const NSUInteger bound = i + 1;
        const id object = array[i];
        while(NSNotFound != (location = [array indexOfObject:object inRange:NSMakeRange(bound, [array count] - bound)]))
        {
            [array removeObjectAtIndex:location];
        }
    }
    return array;
}

+ (NSArray *)removeDuplicatesMap:(NSArray *)arr
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:arr];
    NSMutableDictionary *lookup = [NSMutableDictionary new];
    for(NSUInteger i = 0; i < [array count]; i++)
    {
        const id contained = [lookup objectForKey:array[i]];
        if(contained == nil)
        {
            [lookup setObject:[NSNull null] forKey:array[i]];
        }
        else
        {
            [array removeObjectAtIndex:i];
            i--;
        }
    }
    return array;
}

+ (NSArray *)removeDuplicatesWithMapReturnKeys:(NSArray *)arr
{
    NSMutableDictionary *lookup = [NSMutableDictionary new];
    for(NSUInteger i = 0; i < [arr count]; i++)
    {
        const id contained = [lookup objectForKey:arr[i]];
        if(contained == nil)
            [lookup setObject:[NSNull null] forKey:arr[i]];
    }
    return [lookup allKeys];
}

+ (NSArray *)removeDuplicatesWithMapEnumerate:(NSArray *)arr
{
    NSMutableDictionary *lookup = [NSMutableDictionary new];
    [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         const id contained = [lookup objectForKey:obj];
         if(contained == nil)
             [lookup setObject:[NSNull null] forKey:obj];
     }];
    return [lookup allKeys];
}

+ (NSArray *)removeDuplicatesWithMapFast:(NSArray *)arr
{
    NSMutableDictionary *lookup = [NSMutableDictionary new];
    for(id obj in arr)
    {
        const id contained = [lookup objectForKey:obj];
        if(contained == nil)
            [lookup setObject:[NSNull null] forKey:obj];
    };
    return [lookup allKeys];
}

+ (NSArray *)removeDuplicatesWithMutableSet:(NSArray *)arr
{
    NSMutableSet *set = [[NSMutableSet alloc] initWithCapacity:[arr count]];
    for(id obj in arr)
    {
        [set addObject:obj];
    }
    return [set allObjects];
}

+ (NSArray *)removeDuplicatesSet:(NSArray *)arr
{
    NSSet *set = [[NSSet alloc] initWithArray:arr];
    return [[set allObjects] copy];
}

+ (NSMutableArray *)getTestArrayWithSize:(const int)size
{
    NSMutableArray *testArray = [[NSMutableArray alloc] initWithCapacity:size];
    for(int i = 0; i < size; i++)
    {
        testArray[i] = @(i % UNIQUE_NUMBERS);
    }
    return testArray;
}

+ (NSArray*)performTest:(NSString *)selector array:(NSArray *)arr
{
    return [PastToFast performSelector:NSSelectorFromString(selector) withObject:arr];
}

+ (BOOL)validateArray:(NSArray *)arr
{
    return ([arr count] == UNIQUE_NUMBERS);
}

@end
