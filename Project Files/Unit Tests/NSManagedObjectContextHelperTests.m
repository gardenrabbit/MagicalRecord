//
//  NSManagedObjectContextHelperTests.m
//  Magical Record
//
//  Created by Saul Mora on 7/15/11.
//  Copyright 2011 Magical Panda Software LLC. All rights reserved.
//

#import "NSManagedObjectContextHelperTests.h"

@implementation NSManagedObjectContextHelperTests

- (void) setUp
{
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void) tearDown
{
    [MagicalRecord cleanUp];
}

- (void) testCanCreateContextForCurrentThead
{
    NSManagedObjectContext *firstContext = [NSManagedObjectContext MR_contextForCurrentThread];
    NSManagedObjectContext *secondContext = [NSManagedObjectContext MR_contextForCurrentThread];
    
    assertThat(firstContext, is(equalTo(secondContext)));
}

- (void) testCanNotifyDefaultContextOnSave
{
    NSManagedObjectContext *testContext = [NSManagedObjectContext MR_contextThatNotifiesDefaultContextOnMainThread];

   assertThat([testContext parentContext], is(equalTo([NSManagedObjectContext MR_defaultContext])));
}


@end
